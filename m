Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1A6E9D86
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:59:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbMi-0001LI-WF; Thu, 20 Apr 2023 16:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbMh-0001L5-9x
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbMf-0007BS-Uf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alaHbn+63GKpwyBVcAuHBp/PdRQoaio/NcXxyqFzKWY=;
 b=Z85yQyHmOtl0CsTIaZD0GIMrO6+v6UPhp+C/5fiHjWWukGI623r0JJRn6EJTCpWX7+yFtZ
 GWqbS56FALs7G+gvCg7WN3zrgd8gwyfNLQoa7vlQn4RTJhU7M/P2xMrsPcgpEBpUpVxAk2
 0BrgWL7HFZmhOoee6r2NaMQId/J6CGU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-NpKy4r6FPrSSKPXcLxhYxw-1; Thu, 20 Apr 2023 16:58:48 -0400
X-MC-Unique: NpKy4r6FPrSSKPXcLxhYxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f6632b85fcso319214f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024327; x=1684616327;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=alaHbn+63GKpwyBVcAuHBp/PdRQoaio/NcXxyqFzKWY=;
 b=THAcMEfLZq3XyTcNcbY8JKFZQ8ERBywBCIrQxn67cK+YYkflMjkC/Do/22N53qJppG
 Nw51pGLhKafFhYNF1FQo7sYn47MdlMBscvkWYRNQzeiTTfvfEp9BBz+IgPo18A0qb2Mx
 wmXtOFva5QPD3e5Mbgm8ipyQ15gpjUBkQiBirPI/lTPRUpSugptmghKr1DURe65AjTRL
 +42uhZAWh/97P0Z8armSS9fROXsX8eltftVTAZu4GE/pFreBil35iOPXwnT8OfSJ36ph
 0Mjo7+jvqlUWSWSt7BKyGSin3kt1rfw+a/Sq3gj40ekqMWhUrKkTwEuw0cbT6gqstisu
 zwCA==
X-Gm-Message-State: AAQBX9c7KuSjAlSdnGWQm5M7t7tPlVetB187Rgb92HEmYulCrDlNvQX/
 aDTKaS3kR0QL7CD97gX86rEe2Jok0ICGU0h+2etJPD1wH29WrF7Y7OiLVMkJ7aLh5ol5OjsC0QE
 h1XVUDpYlkFXjRbQ=
X-Received: by 2002:a5d:6182:0:b0:303:2702:6d66 with SMTP id
 j2-20020a5d6182000000b0030327026d66mr625150wru.63.1682024326933; 
 Thu, 20 Apr 2023 13:58:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3kffgCzFeX86Vg0Euw8HLQDuWKrE0JZ1MIqfK9a02BjA8bJZ5WEZZFp51CtH7p2mKk/HPrw==
X-Received: by 2002:a5d:6182:0:b0:303:2702:6d66 with SMTP id
 j2-20020a5d6182000000b0030327026d66mr625132wru.63.1682024326608; 
 Thu, 20 Apr 2023 13:58:46 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5d6e8d000000b002fae2a08089sm2853200wrz.70.2023.04.20.13.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:58:45 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John G Johnson
 <john.g.johnson@oracle.com>,  Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 9/9] docs/style: call out the use of GUARD macros
In-Reply-To: <20230420155723.1711048-10-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:23 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-10-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:58:45 +0200
Message-ID: <87edoeuv7e.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> There use makes our code safer so we should mention them.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


Reviewed-by: Juan Quintela <quintela@redhat.com>


