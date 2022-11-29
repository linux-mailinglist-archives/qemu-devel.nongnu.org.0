Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1D63BD25
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 10:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozx8a-000808-Vm; Tue, 29 Nov 2022 04:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozx8X-0007zb-Hz
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 04:42:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozx8K-0005a1-Nj
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 04:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669714946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ2Wz1NGAnJts1II7vFZUkHRpIi+Z/EXrSflay8KaA0=;
 b=bl7xsjrl39w5zyrMkLqhX6JOXo9dsupsAne8ArzSWLw64LtKI7EqvAF9gLVbAq+6TIq4nO
 jIBPQL1+WjX8Tbt0j2CrAjPy1Hq+SbmCBdrhSjcZso6XNzMlGv+/r9uCoLpyDsOHKK1LJI
 94cZd0fg9XvqC7RsfPaF7rWwNnpOVv4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-BcoZXdhHOAewNoTLf19fzw-1; Tue, 29 Nov 2022 04:42:25 -0500
X-MC-Unique: BcoZXdhHOAewNoTLf19fzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so9923511wme.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 01:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQ2Wz1NGAnJts1II7vFZUkHRpIi+Z/EXrSflay8KaA0=;
 b=1vOK0S4+BnQl6hQPQn8WG7WaK+kNCSzlNf1PZ5ZngD5yPfTKdo/8TdbNydJWZmq+wX
 qoZHtbmrxXoNXSSiLQxhSOa/fHgg2WPSIAI9O1oP6leI5BwaEK7l11eob6MGKy7y1ccM
 0vIXgYIUWRYEjmvJ+Y1osrq+Tadh3IKrJzIh7rLSPFlAh/dqZQlnt/l4cxh26CpvW8x4
 0QPe7yZoEm9JzvCOlLwELIsaplz/KiYczml5F8ZD4g8dGbI+cn+4Gvwwu1kNH6kA6wCF
 iHSJIDqCRbnPw2iY7pphIboIUxUreBEzp3YltBxqWMICZVC3l8kb6pgl2rJKsYUySCpf
 AzKA==
X-Gm-Message-State: ANoB5pl0QJUIT3U0FHL9GCNrTNBold4kT9CgRdm0QDurMl8eryVyUo/f
 GUYq0ASHLp9+nJDIIwUn2Gkp/+Q80gkK12kmD5X/MGsLH6faL7+Z8Ry7BwSyu5DS3VhT6ULLyUo
 eVtTwKTnBgs5NDCU=
X-Received: by 2002:a5d:4946:0:b0:241:f7b9:7c05 with SMTP id
 r6-20020a5d4946000000b00241f7b97c05mr16875228wrs.528.1669714944276; 
 Tue, 29 Nov 2022 01:42:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6bdVXPFueQz6TRfra+NVoa5DvnULqQ65lZzPt43k69Paseo3/PndAclG0EU3XLnO6wTAl7Tg==
X-Received: by 2002:a5d:4946:0:b0:241:f7b9:7c05 with SMTP id
 r6-20020a5d4946000000b00241f7b97c05mr16875216wrs.528.1669714944060; 
 Tue, 29 Nov 2022 01:42:24 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adfe78b000000b0023677fd2657sm13130394wrm.52.2022.11.29.01.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 01:42:23 -0800 (PST)
Date: Tue, 29 Nov 2022 09:42:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Stefan Liebler <stli@linux.ibm.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
Message-ID: <Y4XT/ZxuyU7F5h1n@work-vm>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm> <87wn7ef6cm.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wn7ef6cm.fsf@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
> >> The virtiofsd currently crashes on s390x. This is because of a
> >> `sigreturn` system call. See audit log below:
> >> 
> >> type=SECCOMP msg=audit(1669382477.611:459): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=system_u:system_r:virtd_t:s0-s0:c0.c1023 pid=6649 comm="virtiofsd" exe="/usr/libexec/virtiofsd" sig=31 arch=80000016 syscall=119 compat=0 ip=0x3fff15f748a code=0x80000000AUID="unset" UID="root" GID="root" ARCH=s390x SYSCALL=sigreturn
> >
> > I'm curious; doesn't that mean that some signal is being delivered and
> > you're returning?  Which one?
> 
> code=0x80000000 means that the seccomp action SECCOMP_RET_KILL_PROCESS
> is taken => process is killed by a SIGSYS signal (31) [1].
> 
> At least, that’s my understanding of this log message.
> 
> [1] https://man7.org/linux/man-pages/man2/seccomp.2.html

But isn't that the fallout rather than the cause ? i.e. seccomp
is sending a SIGSYS because the process used sigreturn, my question
is why did the process call sigreturn in the first place - it must
have received a signal to return from?

Dave

> […snip…]
> 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> -- 
> Kind regards / Beste Grüße
>    Marc Hartmayer
> 
> IBM Deutschland Research & Development GmbH
> Vorsitzender des Aufsichtsrats: Gregor Pillen 
> Geschäftsführung: David Faller
> Sitz der Gesellschaft: Böblingen
> Registergericht: Amtsgericht Stuttgart, HRB 243294
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


