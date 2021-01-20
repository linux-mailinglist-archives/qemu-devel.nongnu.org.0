Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53A2FCF30
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:48:16 +0100 (CET)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ByB-00047V-LO
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2Bwb-0003dl-Pp; Wed, 20 Jan 2021 06:46:39 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2BwZ-0002WC-VB; Wed, 20 Jan 2021 06:46:37 -0500
Received: by mail-pj1-x1031.google.com with SMTP id b5so2048834pjl.0;
 Wed, 20 Jan 2021 03:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yYOzLuKqFxE8YnQ3yj48XNy/tN51X+k5Wug+DtbM80I=;
 b=s76OehMaZE4X2KYOANPyoyyXKl4dAtRqBP7kniQCKlwrCigUkoF4NSEN12sTJUcLjg
 BnSyhKTR9hQbPCkaam7o88hFk8CCJEGAvefNEFcQRh30rnYfjSor5su4jtdsTZ9YO7TH
 svOyMop9/9y/YK+dqpfN1cTaqghVseZO92UHc/XuHb28Q8GMd3/ud4evXQE+xLkQUGqa
 JKHDvTMo9XMMcqzFFlDm/dFkqGibJQcIGON7+2Ef3eJAm0IuaB04KRjEiZO92sY9SjRn
 sR0+I50aS3ajjmMvehTccV+3oUXGPJ9cJ6caFPkAkzbmDYs7ckcvjfDCCTWiZG7ne/Pb
 Lthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yYOzLuKqFxE8YnQ3yj48XNy/tN51X+k5Wug+DtbM80I=;
 b=TGslkxExk9zJYt0z//l/SDVLp7txr8kVKUDrXtUKYj6Pslx9zMsdO5NuWg97Rtdgvr
 u9VZNCjMtvfnwETfsiKVQVKGhgzQ1jLmxCyFwK9ZHSy7msam0szF7L626SCVdi8qmee/
 IGMNh6GgYiRncDCBb3S8mzYRdQKddDCvf/DAE9GJ0OdqnY2WDDEZ/FZ6ILe/RB0FfAoH
 oJ4uFYnbKS66m8LEL0rbnCKhaI2jMa/FOQEZd7thitaEBN3hENAcAmBZEZ+T3H2yrhXU
 lFstaTJQWp4o6MceE/7g2PyZWceG9WUghMFgDdJITxyZUVw3oDiPKWbLJYEeMt29Jdbi
 idGQ==
X-Gm-Message-State: AOAM531RxrUIayb8qHIiCC+TVvsa8wRQJpfu5Y1+S3IBwQQl3KYmqjjS
 aRZJNnl3S+qrxgCppn+VwyM=
X-Google-Smtp-Source: ABdhPJxDAMeFYOuwty5Auvw1yshZbCUMXJh4rf8c93r4suM/Zx0L7T8O0s6uy8p779ciKn4VJ49Zgw==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
 d4mr5324613pjo.56.1611143190848; 
 Wed, 20 Jan 2021 03:46:30 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id h6sm2321226pfr.47.2021.01.20.03.46.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jan 2021 03:46:30 -0800 (PST)
Date: Wed, 20 Jan 2021 20:46:27 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210120114627.GA17744@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <YAciaPBu9TuGjifu@apples.localdomain>
 <20210120004417.GA4205@localhost.localdomain>
 <YAfhLnBuNawnFvhE@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAfhLnBuNawnFvhE@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-20 08:52:14, Klaus Jensen wrote:
> On Jan 20 09:44, Minwoo Im wrote:
> > On 21-01-19 19:18:16, Klaus Jensen wrote:
> > > On Jan 20 02:01, Minwoo Im wrote:
> > > > Hello,
> > > > 
> > > > This patch series is third one to support multi-controller and namespace
> > > > sharing in multi-path.  This series introduced subsystem scheme to
> > > > manage controller(s) and namespace(s) in the subsystem.
> > > > 
> > > > This series has new patches from the V2:  'detached' parameter has been
> > > > added to the nvme-ns device.  This will decide whether to attach the
> > > > namespace to controller(s) in the current subsystem or not.  If it's
> > > > given with true, then it will be just allocated in the subsystem, but
> > > > not attaching to any controllers in the subsystem.  Otherwise, it will
> > > > automatically attach to all the controllers in the subsystem.  The other
> > > > t hing is that the last patch implemented Identify Active Namespace ID
> > > > List command handler apart from the Allocated Namespace ID List.
> > > > 
> > > > Run with:
> > > >   -device nvme,serial=qux,id=nvme3
> > > >   -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3
> > > > 
> > > >   -device nvme-subsys,id=subsys0
> > > >   -device nvme,serial=foo,id=nvme0,subsys=subsys0
> > > >   -device nvme,serial=bar,id=nvme1,subsys=subsys0
> > > >   -device nvme,serial=baz,id=nvme2,subsys=subsys0
> > > >   -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0,detached=true
> > > >   -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2
> > > > 
> > > > nvme-cli:
> > > >   root@vm:~/work# nvme list -v                                                                                                      
> > > >   NVM Express Subsystems                                                                                                 
> > > >                                                                                                                                      
> > > >   Subsystem        Subsystem-NQN                                                                                    Controllers
> > > >   ---------------- ------------------------------------------------------------------------------------------------ ----------------
> > > >   nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
> > > >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3
> > > >                                                                                                                                    
> > > >   NVM Express Controllers                                                                                           
> > > >                                                                                                                   
> > > >   Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
> > > >   -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> > > >   nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0
> > > 
> > > Shouldn't nvme0n1 be listed under Namespaces for nvme0?
> > 
> > Oh, I missed that one from the output.  As Keith mentioned, I ran the
> > list command again based on the latest nvme-cli.git:
> > 
> > Please refer the following result.  I think it's okay not to send the
> > cover letter again :)
> > 
> > # nvme --version
> > nvme version 1.13.48.g33c6
> > 
> > # nvme list -v
> > NVM Express Subsystems
> > 
> > Subsystem        Subsystem-NQN                                                                                    Controllers
> > ---------------- ------------------------------------------------------------------------------------------------ ----------------
> > nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
> > nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3
> > 
> > NVM Express Controllers
> > 
> > Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces      
> > -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> > nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0 nvme0n1
> > nvme1    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 
> > nvme2    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 
> > nvme3    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys1 nvme1c3n1
> > 
> > NVM Express Namespaces
> > 
> > Device       NSID     Usage                      Format           Controllers     
> > ------------ -------- -------------------------- ---------------- ----------------
> > nvme0n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme0
> > nvme1n1      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
> 
> That looks better, but hmm. Shouldnt the namespace be named `nvme1c3n1`
> here has well? Is that also an issue with nvme-cli?

No it isn't in this series.  The 'nvme3' controller has not been
provided with 'subsys' parameter which means it does not support CMIC
multi-controller as nvme_init_ctrl() does not set the flag for
NVME_CMIC_MULTI_CTRL:

  -device nvme,serial=qux,id=nvme3

If this has been given with 'subsys' which means it supports for
multi-controller, then it will be given like:

  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0 nvme0c0n1

In short, if 'nvme' device controller is not given with 'subsys', then
it will not support multi-controller and it will never have
GENHD_FL_HIDDEN (nvmeXcYnZ convention).

