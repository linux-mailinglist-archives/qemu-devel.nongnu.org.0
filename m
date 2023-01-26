Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F767D025
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL47p-0007Ha-DU; Thu, 26 Jan 2023 10:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL47m-0007H6-R4
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL47k-000349-Hq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674746711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLHpALNnFKh6iZnYPVthG7loaf9ZhW4bX5v+tQZo3U8=;
 b=C7aNruY9QzfDNvQQtAgtP13jQqJPmJb752XvQYNRwGTB699q4k4qH2/uDnLQKA3TQNzo9r
 tTrItytlWMO0N/gOuqQQOzADyFqBzaXoYg6u5TBeiZlwiYh/MwR+cmpmIjnVLc4WbBPjQF
 7IIBSEjdjUJ7v83UmdTbdy7xxtrPssk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-3EBnebN8NZCD_jrPwwqVUg-1; Thu, 26 Jan 2023 10:25:09 -0500
X-MC-Unique: 3EBnebN8NZCD_jrPwwqVUg-1
Received: by mail-qk1-f198.google.com with SMTP id
 j11-20020a05620a410b00b007066f45a99aso1222116qko.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLHpALNnFKh6iZnYPVthG7loaf9ZhW4bX5v+tQZo3U8=;
 b=fHjQFAqtctnzjcERv8t2MNEaE/xXmF4++NKcpu2RpJS/bBsqPsf6LTspVWTbJid0tl
 5qGqpVHfAhpMwdAnZJiAEirsZX4Xb+sbTrKAJfGgkCCjHQryvzHcf5dGw7j+oeEWOeMH
 M+5NSr1Ybi4XhDNk/XJE9n8gukKNzvXvMfiQDb8LeJMmi5W8wVO9RWw0mEekmOfdw6Qq
 s7GIDUKVEkgvZQqB+C5+lgCxo38H9GtRvKNImESTABDZtDpVzbCkCyZgUZUD5OGUUWoO
 Nhb+QnAL+WaCbMk4458E19CSbju5ZToVB6HecouyybJ9D376n4DpcwrjtTf+1nRdbMNo
 a14g==
X-Gm-Message-State: AFqh2kpw/AiGSeytzh8Z+dThnoeuQZomgE7MqRS+UmNbFi4m7h7WroV2
 vMlyusFy1icBEXYwenLQmXBVfah9KohfBQw/rI703HXizWfHMDAJKeZ/Abww5gOT46GQdkh94kX
 NG+2sh2xLDU7+zGg=
X-Received: by 2002:a05:622a:18a9:b0:3b6:9b37:e03d with SMTP id
 v41-20020a05622a18a900b003b69b37e03dmr47869761qtc.53.1674746709128; 
 Thu, 26 Jan 2023 07:25:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9YLpb5woMwUMtuIgRR20zIXaE7zFzEgn1YxCT67QQsWKHMReP82kGOxuk+X983vGK0/QE9g==
X-Received: by 2002:a05:622a:18a9:b0:3b6:9b37:e03d with SMTP id
 v41-20020a05622a18a900b003b69b37e03dmr47869732qtc.53.1674746708904; 
 Thu, 26 Jan 2023 07:25:08 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b13-20020ac8540d000000b003a97a71c906sm877869qtq.78.2023.01.26.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:25:07 -0800 (PST)
Date: Thu, 26 Jan 2023 10:25:05 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9KbUaMo8DaH0YKv@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KK72k8dZU7Ccau@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> * Michal Prívozník (mprivozn@redhat.com) wrote:
> > On 1/25/23 23:40, Peter Xu wrote:
> > > The new /dev/userfaultfd handle is superior to the system call with a
> > > better permission control and also works for a restricted seccomp
> > > environment.
> > > 
> > > The new device was only introduced in v6.1 so we need a header update.
> > > 
> > > Please have a look, thanks.
> > 
> > I was wondering whether it would make sense/be possible for mgmt app
> > (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> > itself. But looking into the code, libvirt would need to do that when
> > spawning QEMU because that's when QEMU itself initializes internal state
> > and queries userfaultfd caps.
> 
> You also have to be careful about what the userfaultfd semantics are; I
> can't remember them - but if you open it in one process and pass it to
> another process, which processes address space are you trying to
> monitor?

Yes it's a problem.  The kernel always fetches the current mm_struct* which
represents the current context of virtual address space when creating the
uffd handle (for either the syscall or the ioctl() approach).

It works only if Libvirt will invoke QEMU as a thread and they'll share the
same address space.

Why libvirt would like to do so?

Thanks,

-- 
Peter Xu


