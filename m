Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D81582207
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:25:39 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcMM-0004hd-D2
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGcGh-0001SG-Cr
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGcGa-0000P1-2w
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658909974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuT/qe1DCcJGnSW38Ka6ZQWh4Y3+XNV+VTCNVSBHbvs=;
 b=dheGaqeEXE7TEVsm4BVsm530It1DjpS+QXi+w14GeLHPVpQs2vhjKpV5y2o3SqzGEjjAhX
 FoBe/8B0l8e2R7hkz0mnjLVyciEetbabzzAu5W3FqDvo9FLLX71hpSDxNzfzS69dUoWiWJ
 udupnvDnzPMpHFsqgHoA+vzabPvEO7U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-QI1ufbLZP6On_wnaQw40qg-1; Wed, 27 Jul 2022 04:19:33 -0400
X-MC-Unique: QI1ufbLZP6On_wnaQw40qg-1
Received: by mail-ed1-f70.google.com with SMTP id
 c9-20020a05640227c900b0043ad14b1fa0so10217984ede.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuT/qe1DCcJGnSW38Ka6ZQWh4Y3+XNV+VTCNVSBHbvs=;
 b=qgJvmFJDEnz/LurexTFmEpAyCalnjMjgEwqp2RsbBk7C8ZHQu+fa1ecMjzjMKyvcXp
 V8nfpT+NJngG6GvGN2ROvNkOW4mUQe1r92t9rEV2AQDBDaWnm7jhAr2d6XHJoIGx+ypf
 ov6kwyZR+i5WMMRsRONn1lobgaUAAW5eQemAEbrSO7oPKMEzTe5F4xaYGytEnvg0pKXU
 k6AeV4pi65qMl0ZhJkoyBybnMnkF6xLMBEavhqEzW4vf2dtvi16JZkYmuLfYVxVzdo4S
 EsSR46PvKM5N/6+nLBn+xfg7Om5+/hUqiS788UrMslKMEqzizb5tmOSbJC8asBEu7DSo
 xxIA==
X-Gm-Message-State: AJIora9essTtR7x/1SQ2RvkFeE+BK8g+aKKXb+KeK2mFpHNVO6RT9tfE
 sBwuu5jopCKDucbvthgI1U83+BtQP/iAVM2DHVMnOHmo8flg2lFo0hqwedDVmZlPhl2T05/55U8
 0Pf1Y9ldZJLOSD3M=
X-Received: by 2002:a05:6402:354c:b0:43c:2cd0:49bc with SMTP id
 f12-20020a056402354c00b0043c2cd049bcmr10446059edd.48.1658909972338; 
 Wed, 27 Jul 2022 01:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1KG8ZK0GVys0wHa72IOIPmOKk2BY6xOgr/8AEf2x+4dmdaKNHM/PcWIuoPQ+mfc3SsNuwpw==
X-Received: by 2002:a05:6402:354c:b0:43c:2cd0:49bc with SMTP id
 f12-20020a056402354c00b0043c2cd049bcmr10446040edd.48.1658909972039; 
 Wed, 27 Jul 2022 01:19:32 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906310b00b00722fc0779e3sm7213889ejx.85.2022.07.27.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:19:31 -0700 (PDT)
Date: Wed, 27 Jul 2022 10:19:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Huang Rui <ray.huang@amd.com>
Cc: anthony.perard@citrix.com, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Trigger Huang <Trigger.Huang@amd.com>
Subject: Re: Question to mem-path support at QEMU for Xen
Message-ID: <20220727101930.66ed56e1@redhat.com>
In-Reply-To: <Yt+XS81vmsWoJA5y@amd.com>
References: <Yt+XS81vmsWoJA5y@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jul 2022 15:27:07 +0800
Huang Rui <ray.huang@amd.com> wrote:

> Hi Anthony and other Qemu/Xen guys,
> 
> We are trying to enable venus on Xen virtualization platform. And we would
> like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> supported with Xen. I verified the same function on KVM.
> 
> qemu-system-i386: -mem-path not supported with Xen
> 
> So may I know whether Xen has any limitation that support
> memory-backend-memfd in QEMU or just implementation is not done yet?

Currently Xen doesn't use guest RAM allocation the way the rest of
accelerators do. (it has hacks in memory_region/ramblock API,
that divert RAM allocation calls to Xen specific API)

The sane way would extend Xen to accept RAM regions (whatever they are
ram or fd based) QEMU allocates instead of going its own way. This way
it could reuse all memory backends that QEMU provides for the rest of
the non-Xen world. (not to mention that we could drop non trivial
Xen hacks so that guest RAM handling would be consistent with other
accelerators)

> Looking forward to your reply!
> 
> Thanks a lot,
> Ray
> 


