Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710A63B19D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozjAG-0001JC-2p; Mon, 28 Nov 2022 13:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozjAD-0001Im-Ug
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozjAC-0002Rh-8B
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669661250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NTBV4MIXUgutoj6XawMzzWbRwiFAfKWVYoxSyCgq/98=;
 b=WnPcZp4M1lAo43Fj6hoDxCzWe4Oa36qNVeTdUwLi9UbvMpOE6/lhWYh44zL1p0e8MHr/aK
 h38Y2ESaQ5aJl2vgjSWREhpXMf7aA8gciDlmzUBlqGrgufIvFrh0XDXIyA+D5MGrMxEB1+
 z1QbBhO5WprKfZSlXsWm5bfq8r+FVmQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-MqaqypXtNwWxgo8RzJYSjA-1; Mon, 28 Nov 2022 13:47:29 -0500
X-MC-Unique: MqaqypXtNwWxgo8RzJYSjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l9-20020adfa389000000b00241f907e102so2243264wrb.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTBV4MIXUgutoj6XawMzzWbRwiFAfKWVYoxSyCgq/98=;
 b=1iM8UehaluZR05fIj6fpMAyiz+c+oGEKukTfXh2pAOa8dzoDPeqRqOaqB3CilFLDNW
 oaGcZJ/c79AFxYE0RxvbPE4EbqaqmgHGOTy8JsbNh5HIKGMxgP1sKnSbLb2KJw5ptc+b
 mNTXWq5g9vyo/+CmGdArbE533YnlEf2MLRv20QbGa53HqLXWrlQbv4bdjo84Qv3Q74R/
 1O0zHhI3tXlFssVl5kljTAbWB++RnQzEmSKVGoJTCQCWkq9ZQS/25Y8IQXLrRRN+c3Cj
 GtMB7E8rl5cTwE2InJguSzcQJW0ikQ4rZxEAFzQxYGEgKA9HIpJzA4EQHCbDdkAHf32y
 Z1cw==
X-Gm-Message-State: ANoB5pm029SD81znG9lQ+fI8bnXfNL2/OVyOc/dIesWT6JE3/HQHI19R
 p+SS81OsnNRR6IDpssJptOIMO6jnplt+PSZPkQhSPXII4Bk/iKOpibqm0cyD1Yyw2W35O39jexb
 nILTQ9St7M+nKAlk=
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id
 f5-20020a5d5685000000b00235f0a6fafdmr32915689wrv.75.1669661248300; 
 Mon, 28 Nov 2022 10:47:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5YjmHlrISk2cNWccA9xV5Dhp3pCcXAkBAH5FgLSqpQXgwirfFQlSjyqaKeghVYKiMYKmeEQA==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id
 f5-20020a5d5685000000b00235f0a6fafdmr32915678wrv.75.1669661248062; 
 Mon, 28 Nov 2022 10:47:28 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a5d4a0f000000b00235da296623sm11529290wrq.31.2022.11.28.10.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:47:27 -0800 (PST)
Date: Mon, 28 Nov 2022 18:47:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Stefan Liebler <stli@linux.ibm.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
Message-ID: <Y4UCPQ0E2ZY15aEq@work-vm>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125143946.27717-1-mhartmay@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
> The virtiofsd currently crashes on s390x. This is because of a
> `sigreturn` system call. See audit log below:
> 
> type=SECCOMP msg=audit(1669382477.611:459): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=system_u:system_r:virtd_t:s0-s0:c0.c1023 pid=6649 comm="virtiofsd" exe="/usr/libexec/virtiofsd" sig=31 arch=80000016 syscall=119 compat=0 ip=0x3fff15f748a code=0x80000000AUID="unset" UID="root" GID="root" ARCH=s390x SYSCALL=sigreturn

I'm curious; doesn't that mean that some signal is being delivered and
you're returning?  Which one?

Dave

> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index 888295c073de..0033dab4939e 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] = {
>  #endif
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
> +    SCMP_SYS(sigreturn),
>      SCMP_SYS(symlinkat),
>      SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


