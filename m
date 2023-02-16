Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C637A699231
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:49:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbpV-0001sj-29; Thu, 16 Feb 2023 05:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSbpT-0001sU-HI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSbpS-0000my-2K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676544569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mp/5NPYuqZEIC6JQGT4zadwj9EzpsXntcR+ZDA0GV4=;
 b=WwG4hTLDZBqiIaPs7BdHitdQTDV0jUWlGfaiKjba7UYgezPrxg83iBf7+Ub4eEvfr6fKn5
 MZQjyx3SGkusbMU1iLcOvYfXLP13VVR9k+OKPu9A07HDIv/F1szowRe3ICRv3iSUZ2csAJ
 Q8kBOq0i/43/R+wz/jGoKfYAmKP+fc8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-pyLLc65eNhmFD7HDGunaXQ-1; Thu, 16 Feb 2023 05:49:22 -0500
X-MC-Unique: pyLLc65eNhmFD7HDGunaXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c468e00b003e0107732f4so674179wmo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0mp/5NPYuqZEIC6JQGT4zadwj9EzpsXntcR+ZDA0GV4=;
 b=O8qdIzFbwFfGRQR6tVFimztN2aGLLQEgzBC45XSfFAbnxOgePVqxpu9cQk4ieYigj5
 hpZCEkn/B/r2Cknw561Ml3nIpetO0W3NpJKW+F3ryF+srr5eNPMdVu7IJaIo5b1QiHSV
 3Ue+buLRRwF7uxOE6P2M8V+mpN9pXaPr5+De7CVvZcNuB8pR+Id/XZTCAgHiVlMFTGW7
 AzxVCqHHEuXCKMx8qQtlO4PWo5ddJFRdmOURGibTjyslhm7EU0lA2EiNNBLJPbGiRD8o
 un7PjxhA+RxnqEwRVjsiFbH5mfGlzaClu0Q6JxR966wJYa6WjBlMhZLFIJ/MxJGS9xVh
 nNSQ==
X-Gm-Message-State: AO0yUKUWkuPVh11kOb74kMUxxEFpKi3GwVeFrupIVZnMxuE3wHm5l6bz
 CMb7Ee1T0+V76+2mO/akjlRitkGl+6qxPcwmsibO1cTo1nDqUJgg6acDcZdRkkAkkiMb9yYjVXM
 jAIz/v9SqsACaEp4=
X-Received: by 2002:a05:600c:1819:b0:3e0:10d:f1c with SMTP id
 n25-20020a05600c181900b003e0010d0f1cmr4462771wmp.37.1676544561181; 
 Thu, 16 Feb 2023 02:49:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+B1zFIl90aF0R+eAMIiTyFG1TkEW/4tpInIRw89ogAnpQirNgkpZidPT1Gis/ebjMR+t/vmQ==
X-Received: by 2002:a05:600c:1819:b0:3e0:10d:f1c with SMTP id
 n25-20020a05600c181900b003e0010d0f1cmr4462750wmp.37.1676544560914; 
 Thu, 16 Feb 2023 02:49:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bca49000000b003c6bbe910fdsm4998609wml.9.2023.02.16.02.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:49:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Paul Durrant <paul@xen.org>,  Joao Martins
 <joao.m.martins@oracle.com>,  Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Claudio Fontana <cfontana@suse.de>,
 Julien Grall <julien@xen.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>,  vikram.garhwal@amd.com
Subject: Re: [RFC PATCH v11bis 00/26] Emulated XenStore and PV backend support
In-Reply-To: <20230216094436.2144978-1-dwmw2@infradead.org> (David Woodhouse's
 message of "Thu, 16 Feb 2023 09:44:10 +0000")
References: <20230216094436.2144978-1-dwmw2@infradead.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 11:49:19 +0100
Message-ID: <87sff5khqo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

David Woodhouse <dwmw2@infradead.org> wrote:
> The non-RFC patch submisson=C2=B9 is just the basic platform support for =
Xen
> on KVM. This RFC series is phase 2, adding an internal XenStore and
> hooking up the PV back end drivers to that and the emulated grant tables
> and event channels.
>
> With this, we can boot a Xen guest with PV disk, under KVM. Full support
> for migration isn't there yet because it's actually missing in the PV
> back end drivers in the first place (perhaps because upstream Xen doesn't
> yet have guest transparent live migration support anyway). I'm assuming
> that when the first round is merged and we drop the [RFC] from this set,
> that won't be a showstopper for now?
>
> I'd be particularly interested in opinions on the way I implemented
> serialization for the XenStore, by creating a GByteArray and then dumping
> it with VMSTATE_VARRAY_UINT32_ALLOC().

And I was wondering why I was CC'd in the whole series O:-)

How big is the xenstore?
I mean typical size and maximun size.

If it is suficientely small (i.e. in the single unit megabytes), you can
send it as a normal device at the end of migration.

If it is bigger, I think that you are going to have to enter Migration
iteration stage, and have some kind of dirty bitmap to know what entries
are on the target and what not.

As examples, we are going to discuss how to migrate Vhost-user-fs in the
near future, and as far as I know that is something similar to the
Xenstore (from 10000 feet view, both are a (key, value) store, no?).

We are having starting other discussions about how to migrate vfio and
(not yet started) vhost/vpda devices, so you can get some "inspiration"
from there if you are going the "opaque" route.

Later, Juan.


