Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798D566641
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:38:33 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8f0q-0007ER-0P
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8ezR-0005zS-7k
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8ezM-0005X5-QD
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657013820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHp/zB1b51CCtznr77GfrvUWosAhjznKb1pU6/QYy2U=;
 b=U7gwYu8zMmWudpiVR+5ADwrQFQMNb7jtPU1yLIP2d/CrjOgmW2rf7ubASwfP2f3CkVUOzZ
 JD9Og5AmS8OpF9UOhHNXOQ421TUVH7s74EOY27JgAGbdcIE4ZbOh+blOGt3Lj4bTonOPKo
 +xpRNOn3uckS0mXaU/3tFg1NxW3wwQE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617--vxiNH76N3GWxy_4fNClIg-1; Tue, 05 Jul 2022 05:36:59 -0400
X-MC-Unique: -vxiNH76N3GWxy_4fNClIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so6538860wmb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KHp/zB1b51CCtznr77GfrvUWosAhjznKb1pU6/QYy2U=;
 b=ALQkakrJrx4YfOoMUifXudjmQyelAqKBfjE9OOSp69byYGGrOG5zgQcakCC5A4+v0u
 6Be7PXXE82SveQfoW6xu54xCmlmIr7l3F4jDUuAq+JrdQj5ynF66T1GDIYif5lZzbqww
 95blNg/jU8geRKRGqVrycecuxWGreEqLVs4e2hRx/J1gND8RFiRou3O+KExa+kkvlQI9
 PS5yzFE8Y8dIRwtBZnO0Rx9o7cm3wFWFF421WPpDKbzP0/hRR0QYisgvBUapmTaKILsW
 9PhluGjl8PnaZRpS1pflKTaoEyGYmRiGciyMleilTektjvw+F40E7yWKztOZhZVctEYH
 xr4w==
X-Gm-Message-State: AJIora9tGMApktR+n4rKSYiYLSrlpV+a2I040HdClG6SjRRjOTvM76fp
 l6a0okEtzwZ9rBWVNglEq12mSe0oDSP+egk7kdPY6COAyqFc5ah6J1zFxHTqZVDoL/TtuDTLvy3
 3Qzum166cqFT5HHc=
X-Received: by 2002:a05:6000:1788:b0:21d:2eb7:fc3c with SMTP id
 e8-20020a056000178800b0021d2eb7fc3cmr30575910wrg.212.1657013817512; 
 Tue, 05 Jul 2022 02:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpSR7QJc0Uri8/GlpMv+SdAJx7r4lmb9f6GD9JWdwCz9o2+AWHtldXzDJqdmEJyeFjIxDLeA==
X-Received: by 2002:a05:6000:1788:b0:21d:2eb7:fc3c with SMTP id
 e8-20020a056000178800b0021d2eb7fc3cmr30575896wrg.212.1657013817358; 
 Tue, 05 Jul 2022 02:36:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1c4303000000b003a03185231bsm22181177wma.31.2022.07.05.02.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 02:36:56 -0700 (PDT)
Date: Tue, 5 Jul 2022 10:36:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Zhao, Shirley" <shirley.zhao@intel.com>
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
Message-ID: <YsQGNk5hLv8b6DJS@work-vm>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com>
 <YsPwbbiuxtkD6HSp@work-vm>
 <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Zhao, Shirley (shirley.zhao@intel.com) wrote:
> Thanks for the information. 
> Yes, I also found the memory backend options on s390x, and also copy the command to x86, but failed. 
> 
> The following is the command used to start qemu + virtiofs + ubuntu 20.04. 
> One is worked well using NUMA, another one is failed without NUMA. 
> Is there anything wrong? 
> 
> The worked one with NUMA options: 
> 
> qemu-system-x86_64 -M pc -cpu host --enable-kvm -smp 2 -m 4G -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on -numa node,memdev=mem -chardev socket,id=char0,path=/tmp/vfsd.sock -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs -chardev stdio,mux=on,id=mon -mon chardev=mon,mode=readline -device virtio-serial-pci -device virtconsole,chardev=mon -vga none -display none -drive if=virtio,file=ubuntu.img
> 
> The failed one without NUMA options: 
> 
> qemu-system-x86_64 -M pc -cpu host --enable-kvm -smp 2 -m 4G -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on -machine q35,memory-backend=mem -chardev socket,id=char0,path=/tmp/vfsd.sock -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs -chardev stdio,mux=on,id=mon -mon chardev=mon,mode=readline -device virtio-serial-pci -device virtconsole,chardev=mon -vga none -display none -drive if=virtio,file=ubuntu.img

What error did it give?

20.04 is quite old, what qemu version is it?

I'd have to check when the memdev= went in.

Dave

> 
> Thanks. 
> - Shirley 
> 
> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com> 
> Sent: Tuesday, July 5, 2022 4:04 PM
> To: Thomas Huth <thuth@redhat.com>
> Cc: Zhao, Shirley <shirley.zhao@intel.com>; qemu-devel@nongnu.org; virtio-fs@redhat.com; Stefan Hajnoczi <stefanha@redhat.com>
> Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
> 
> * Thomas Huth (thuth@redhat.com) wrote:
> > On 05/07/2022 03.02, Zhao, Shirley wrote:
> > > Hi, all,
> > > 
> > > I want to use virtiofs to share folder between host and guest.
> > > 
> > >  From the guide, it must set the NUMA node.
> > > https://virtio-fs.gitlab.io/howto-qemu.html
> > > 
> > > But my guest doesn’t support NUMA.
> > > 
> > > Is there any guide to use qemu + virtiofs without NUMA?
> > > 
> > > Or does qemu have any plan to support it?
> > 
> >  Hi!
> > 
> > At least on s390x, you can also specify the memory backend via the 
> > -machine option instead of using the -numa option, e.g.:
> > 
> >  qemu-system-s390x -machine memory-backend=mem \
> >   -object memory-backend-file,id=mem,...
> > 
> > Not sure whether that works on other architectures, too, though. 
> > Stefan, David, do you know?
> 
> Right, that's the way I do it on x86.
> We wrote virtiofs before the memory-backend option existed, which is why the old docs talk about using the NUMA stuff.
> 
> Dave
> 
> >  Thomas
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


