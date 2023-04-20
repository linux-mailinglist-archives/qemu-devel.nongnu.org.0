Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CE6E9DB5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:14:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbbU-0004WR-7U; Thu, 20 Apr 2023 17:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbbT-0004WF-1S
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbbR-0002HT-2h
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682025244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TITUkxebwiJuAbGKFdlEzP2n/AtBTaCU/55gDOlx8aY=;
 b=Ts+9P9NL5La7HlHy4fKyLNpx6jLIyjMpmoZ6jqU/im44gUZqIhfa0QX1pCSXA8yiy5WsWr
 LRIaK6Pj79ycbAKO9v0l4fLKngiBc1/mtoXDKIF/9YDljPEFnWIOBwy3VLj51UrbxPAwVk
 IoTUctZ7K5geGX0/Z7bWPgeznVlBUU8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-_Yw8PpXdPrafr88M1JtLRw-1; Thu, 20 Apr 2023 17:13:53 -0400
X-MC-Unique: _Yw8PpXdPrafr88M1JtLRw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f479aeddc4so593702f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682025232; x=1684617232;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TITUkxebwiJuAbGKFdlEzP2n/AtBTaCU/55gDOlx8aY=;
 b=CpL0g/2BnrJsrrCcQeqSph5ZOfyCZ4Crt0cEpLLr6YANfZ0jp0LIHsuY5RX52xUHiM
 urk5Ce9pOtuoyFlm1vhok3Rfp4cWoeXHmcpUKhjHDruyLU25wFW00M4RylZaPgDFOMDA
 Z3i9rp6Ja7mxA8BKexVhTk2FnEzY21682KY0DG0vYZYDzIjH0LhZkW6USNhj61/bXVDm
 rukxNgUOwCJqT6TywOQG3LNKoIHpF2lGubEnjTOaZABVbXUOS+jq56pvXzucjM+c5c9q
 hroFln0BKboX3Szb7SOoP/M8yuGj5A/HeoJSlGDxBaLoNLo01lTS/QkVwpgWRk4Je2++
 blVg==
X-Gm-Message-State: AAQBX9eVpbYPUv6Gty9qf5houGlnaeCh/AEUeoK97LCEOLCFmTHDLiiz
 MC0t/9vnxSiT0nfPmMGkGUPYTFLFbnTNqEPXFxNbo8DNzkGZe/xYE1j9VmTVAjpJVCKkQh8Xcbj
 Fw9TvPx/aByyDKRc=
X-Received: by 2002:a5d:4a45:0:b0:2f8:96f5:cb0f with SMTP id
 v5-20020a5d4a45000000b002f896f5cb0fmr2142520wrs.23.1682025232169; 
 Thu, 20 Apr 2023 14:13:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwSeR6KcnjZqLOtSufdH6Pgme7Ug5YJXLqbwrso51UHVCHh5Yyvi1HrXW25wxyzUQwxrhmjw==
X-Received: by 2002:a5d:4a45:0:b0:2f8:96f5:cb0f with SMTP id
 v5-20020a5d4a45000000b002f896f5cb0fmr2142512wrs.23.1682025231946; 
 Thu, 20 Apr 2023 14:13:51 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 z10-20020a5d654a000000b002f22c44e974sm2855130wrv.102.2023.04.20.14.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 14:13:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/13] ram.c: Dont change param->block in the
 compress thread
In-Reply-To: <e77d30005c480b79e4bb17ce67d651b621112299.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:47:59 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <e77d30005c480b79e4bb17ce67d651b621112299.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 23:13:50 +0200
Message-ID: <87wn26tfxt.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> Instead introduce a extra parameter to trigger the compress thread.
> Now, when the compress thread is done, we know what RAMBlock and
> offset it did compress.
>
> This will be used in the next commits to move save_page_header()
> out of compress code.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Much better, thanks.


