Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C897C3E5918
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:29:16 +0200 (CEST)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDPwZ-0007HX-BE
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDPvp-0006cx-Jc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDPvl-00063e-Fi
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628594904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cl4cRykzWMBUj7U1Kr1JrAa15bZRqOiN6u3UDTIUgqk=;
 b=GrpSvbaeKfvgrvTYUrRH15RhKNBzNBEt/9N0SX/MrDvwRTtMdhjtHdWrEpQlVkaLjIO9Au
 HRWwqm3hqImbb25Viob25E7pyFr7EE011p0n/xz0EAukfd0CMhb0cN+g3Lhpub2sUNpSp2
 y23XEH8vtOiLiROd5uW4u/Tx3X+Zhfg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-aVPQovI_OLaUpPVc3sX3lQ-1; Tue, 10 Aug 2021 07:28:19 -0400
X-MC-Unique: aVPQovI_OLaUpPVc3sX3lQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so935884wml.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cl4cRykzWMBUj7U1Kr1JrAa15bZRqOiN6u3UDTIUgqk=;
 b=MjiZ+5xnn6PCnaU1qg8QueiZ53t6Fo909D0iP2xHoITr2rwOSuvnY8wFlNrzmmDiik
 4MvOpKco5rbV9IuCPkAUuW+z0OD1rAM8YS/1wyCcOlS0nHJNxC4w7e16vBFm4ufPUSqm
 exVAn92J09hlNpyozKMwFOt648JQb0bF1aMHYUZNphfRY5mCkdSGVgfAcAX1Y5H5ydVR
 SFBUv5rl/LQJXvC5pRn6OWr48ZVLnqzCJZJBYM6AwODyFjh2sAGbmrGbRzix0wYQocZz
 dXc+inog8sQYeVEazn/IGNe/Y372ZHoi8j15JY3BtjD48dwSIRP5pn/+pY8xQH4bttxO
 0NFg==
X-Gm-Message-State: AOAM530LONAMZ5umBtDfXFHgxPnDJmQtJMOOnbQo35sepr79dQbdo0DR
 Z8f/nl38h255mj95qwHEL+iCxSJovUBS6C5C9QwVgryQqNyS7FK6xOV4fJ/87CSGePe+MOK5CnL
 XFklVyWf/4p++3a4=
X-Received: by 2002:adf:d194:: with SMTP id v20mr30507011wrc.126.1628594898385; 
 Tue, 10 Aug 2021 04:28:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7bfESeH0AnCdaV1N3uuGH9ash4SMhAS00dqptTEPHC6JKPcC0fTWW8VXpdrZ/vVFxqCZNFA==
X-Received: by 2002:adf:d194:: with SMTP id v20mr30506997wrc.126.1628594898204; 
 Tue, 10 Aug 2021 04:28:18 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id j2sm2968399wmi.36.2021.08.10.04.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 04:28:17 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:28:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Samarth Saxena <samarths@cadence.com>, ben.widawsky@intel.com
Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Message-ID: <YRJizxKbMxpwhSrL@work-vm>
References: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Samarth Saxena (samarths@cadence.com) wrote:
> Hi All,
> 
> I am trying the following command to run Qemu with Kernel 5.14.

cc'ing in Ben who I think owns the CXL stuff.

> qemu-system-x86_64 -M q35,accel=kvm,nvdimm=on,cxl=on,hmat=on -m 8448M,slots=2,maxmem=16G -smp 8,sockets=2,cores=2,threads=2 -hda /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_backup.qcow2 -enable-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/ -object memory-backend-ram,id=cxl-ram,share=on,size=256M -device "pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-window-base=1,window-base[0]=0x4c0000000,memdev[0]=cxl-ram" -device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0 -device cxl-type3,bus=rp0,memdev=cxl-ram,id=cxl-vmem0,size=256M -numa node,nodeid=0,memdev=cxl-ram -object memory-backend-ram,id=other-ram,size=8G,prealloc=n,share=off -numa node,nodeid=1,memdev=other-ram,initiator=0 -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=0,socket-id=1

You probably need to state which qemu tree and version you're using
here.

> I get the following crash before the machine starts to boot.
> 
> qemu-system-x86_64: ../softmmu/memory.c:2443: memory_region_add_subregion_common: Assertion `!subregion->container' failed.

It's probably best to check with Ben, but you'll want a backtrace and
figure out which subregion and region you're dealing with.

Dave

> 
> Please help me find what's wrong here.
> 
> Regards,
> [CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cadence.com/en_US/home.html>
> Samarth Saxena
> Sr Principal Software Engineer
> T: +911204308300
> [UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
> [16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https://www.cadence.com/en_US/home/company/careers.html>
> 
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


