Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B66BD270
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcofK-0005si-Lt; Thu, 16 Mar 2023 10:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcofI-0005sX-S1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcofH-00023e-EX
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977190;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vsmm5zdQ5BK0oup4Mb+sDHj9EkheEAurwV4iAG2d5r8=;
 b=Ad6mDgG9GOI7IRQ4+9Nx2liQamB3rfV2Gqn5QiBTUnMx7xl6Ch8j7OlESVRetTQNWoprhO
 3S9M+pYVpV0MSwWNRl7NIJrcVKAwTeh7WJ5B6zWyV67JXnwE5ujgSB7B9gjzLQ7TRFF/sO
 ArLV79wKrLcnXiSj43cPpOLLLTBAqS4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-S2COIgGVM-OSpu-0lvohwg-1; Thu, 16 Mar 2023 10:33:09 -0400
X-MC-Unique: S2COIgGVM-OSpu-0lvohwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m28-20020a05600c3b1c00b003ed307fddadso2716472wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678977188;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vsmm5zdQ5BK0oup4Mb+sDHj9EkheEAurwV4iAG2d5r8=;
 b=jk6KqygBZclrpBvqjU+esSX7tmpl4jFNwpy/ya9RPUxjZmLzZ9UJL0STWj6qU5Z9wq
 yA6QNgEUDX2GK/La+r1nCFBslhclGTVPY+FaCuXcnHEsoxlmh9ngMlWYOtvPzwGAMdwv
 vWEgHD3kdlH3ezA6YvRbkXeqII3SmFao7ceMThlPD/wUHX8zQJyN7PvxwM5i+0OxPtIH
 PcHqP4gFfbJNyH/uzGd93SKfONfp6aurPM2+gVcyF5pEz8JfUur3MSNibXM6H/b17ssk
 SgG70nkJH3ioHSmH/mzA1C+Q2cAlEnM5rHpIZDIdnRrGnge4uLilMFpi4HRuIO1RY1xs
 j44g==
X-Gm-Message-State: AO0yUKVBFMmYYYJLIfM2kNPZkrjS4qzogo43DuqSGJO3II/xoDwmHw40
 fvVPDTXUdCfEkQvgfI+J/yGhbe6tx1l/tCoGuo/+0YQ+lWgeuNccAs1BdkHok8GSmmuR6dbOZSD
 2ApvwAC7UGdOEdgE=
X-Received: by 2002:a05:600c:4e8f:b0:3ed:32cd:be64 with SMTP id
 f15-20020a05600c4e8f00b003ed32cdbe64mr6587437wmq.29.1678977188279; 
 Thu, 16 Mar 2023 07:33:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+jwyXs5/PvzMSXgtqj+ZATd0HiTvMbSnVvLqOveFRYdvyhR0gAOoaI/URsjNLNRI1zR8rZzg==
X-Received: by 2002:a05:600c:4e8f:b0:3ed:32cd:be64 with SMTP id
 f15-20020a05600c4e8f00b003ed32cdbe64mr6587417wmq.29.1678977188002; 
 Thu, 16 Mar 2023 07:33:08 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003ed246c1d28sm5329152wmf.44.2023.03.16.07.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:33:07 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Wei Wang <wei.w.wang@intel.com>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1] migration/multifd: correct multifd_send_thread to
 trace the flags
In-Reply-To: <20230309102956.8030-1-wei.w.wang@intel.com> (Wei Wang's message
 of "Thu, 9 Mar 2023 18:29:56 +0800")
References: <20230309102956.8030-1-wei.w.wang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 15:33:06 +0100
Message-ID: <87v8j0lqal.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Wei Wang <wei.w.wang@intel.com> wrote:
> The p->flags could be updated via the send_prepare callback, e.g. OR-ed
> with MULTIFD_FLAG_ZLIB via zlib_send_prepare. Assign p->flags to the
> local "flags" before the send_prepare callback could only get partial of
> p->flags. Fix it by moving the assignment of p->flags to the local flags
> after the callback, so that the correct flags can be traced.
>
> Fixes: ab7cbb0b9a3b ("multifd: Make no compression operations into its own structure")
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>

Good catch.  Thanks.
queued.


