Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98816EA2CB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:28:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppiNH-0000pZ-0a; Fri, 21 Apr 2023 00:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppiNF-0000pK-Ie
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:27:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppiND-0008HK-7r
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:27:53 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L3sgXR002807; Fri, 21 Apr 2023 04:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xjFBPNjXM9+ap1Td8w9ur+5Fy0d5F7VAxm3ycTgOwIk=;
 b=BFhLasLLcAPHfSa4HS2ps5zGXYwI+xf6P1wN1RiJg/LuFgUuVBO2dGUKS7YZrym/19PM
 3Vk6GUYt4caCWWyJNCAJ3CAaMIG77Xl/DAOQBF6VsSNeRK96BG9OHsda/0klNYqVmA5t
 e6i9itKJPL2lnRjF6K5AN/52KM+C/82U2Iadu4MW+wuW3J5Mk50Z+tDdEG/KDPYQ8NkJ
 DJnPNI0Z+PBvt1xewCG7urLopSA50MYTutboc34ghyiNWLoHtHHSgApE43/4o+0AJlQs
 ZLCqecJMOOajIwt3R6g4ceRYaVANi9/htoAMu+tKfdgGNtFbi1RaSjdwAwQXv5VltDNO ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3k05gxap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:27:48 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33L3ssOX003437;
 Fri, 21 Apr 2023 04:27:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3k05gxa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:27:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K4oCMe030869;
 Fri, 21 Apr 2023 04:27:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6bsfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:27:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33L4Rhvo17039922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 04:27:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA1C20049;
 Fri, 21 Apr 2023 04:27:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86EE920040;
 Fri, 21 Apr 2023 04:27:40 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.121.215])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Apr 2023 04:27:40 +0000 (GMT)
Date: Fri, 21 Apr 2023 09:57:36 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: Harsh Prateek Bora <harsh.prateek.bora@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Message-ID: <ZEIQuNG54+3zRkhi@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
 <20230420125217.620928-3-kconsul@linux.vnet.ibm.com>
 <CAEuJdmpXiTNpdW_Wi+9dFMfvMsAgbvsw+mVB7+ptNoUArkjhsg@mail.gmail.com>
 <ZEIGJn9gxV7bQ//O@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <1be5d2af-23cd-5fda-7b41-cd0c8374d866@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1be5d2af-23cd-5fda-7b41-cd0c8374d866@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b_169zdpNOC9ZTB27bXytuR7TL2twPB1
X-Proofpoint-ORIG-GUID: ED6xnyLc1X8-CtBDvqGfH0G0ZWXP4vCO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210033
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-04-21 09:23:52, Harsh Prateek Bora wrote:
> 
> 
> On 4/21/23 09:12, Kautuk Consul wrote:
> > Hi,
> > 
> > On 2023-04-20 19:20:40, Harsh Prateek Bora wrote:
> > > Since we are optimising code a lot, one suggestion below:
> > > 
> > > 
> > > On Thu, Apr 20, 2023 at 6:23 PM Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > wrote:
> > > 
> > > > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> > > > boot_linux.py test-case due to which the code coverage for ppc
> > > > decreased by around 2%. As per the discussion on
> > > > https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> > > > was mentioned that the baseline test for ppc64 could be modified
> > > > to make up this 2% code coverage. This patch attempts to achieve
> > > > this 2% code coverage by adding various device command line
> > > > arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> > > > test-case.
> > > > 
> > > > The code coverage report with boot_linux.py, without it and finally
> > > > with these tuxrun_baselines.py changes is as follows:
> > > > 
> > > > With boot_linux.py
> > > > ------------------
> > > >    lines......: 13.8% (58006 of 420997 lines)
> > > >    functions..: 20.7% (7675 of 36993 functions)
> > > >    branches...: 9.2% (22146 of 240611 branches)
> > > > Without boot_linux.py (without this patch changes)
> > > > --------------------------------------------------
> > > >    lines......: 11.9% (50174 of 420997 lines)
> > > >    functions..: 18.8% (6947 of 36993 functions)
> > > >    branches...: 7.4% (17580 of 239017 branches)
> > > > Without boot_linux.py (with this patch changes)
> > > > -----------------------------------------------
> > > >    lines......: 13.8% (58287 of 420997 lines)
> > > >    functions..: 20.7% (7640 of 36993 functions)
> > > >    branches...: 8.4% (20223 of 240611 branches)
> > > > 
> > > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > > Reported-by: Alex Bennée <alex.bennee@linaro.org>
> > > > ---
> > > >   tests/avocado/tuxrun_baselines.py | 120 +++++++++++++++++++++++++++++-
> > > >   1 file changed, 116 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/tests/avocado/tuxrun_baselines.py
> > > > b/tests/avocado/tuxrun_baselines.py
> > > > index d343376faa..ae082ac028 100644
> > > > --- a/tests/avocado/tuxrun_baselines.py
> > > > +++ b/tests/avocado/tuxrun_baselines.py
> > > > @@ -11,6 +11,7 @@
> > > > 
> > > >   import os
> > > >   import time
> > > > +import tempfile
> > > > 
> > > > <snip>
> > > >           """
> > > > -        self.common_tuxrun(drive="scsi-hd")
> > > > +
> > > > +        # add device args to command line.
> > > > +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0
> > > > -:22',
> > > > +                         '-device', 'virtio-net,netdev=vnet')
> > > > +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> > > > +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> > > > +
> > > >   '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> > > > +                         '"bus":"pci.0","addr":"0x9"}')
> > > > +        self.vm.add_args('-device',
> > > > '{"driver":"qemu-xhci","p2":15,"p3":15,'
> > > > +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> > > > +        self.vm.add_args('-device',
> > > > '{"driver":"virtio-scsi-pci","id":"scsi0"'
> > > > +                         ',"bus":"pci.0","addr":"0x3"}')
> > > > +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
> > > > +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> > > > +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
> > > > +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> > > > +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> > > > +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> > > > +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> > > > +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> > > > +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
> > > > +                         ',"bus":"usb.0","port":"1"}')
> > > > +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> > > > +                         ',"bus":"usb.0","port":"2"}')
> > > > +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> > > > +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> > > > +        self.vm.add_args('-object',
> > > > '{"qom-type":"rng-random","id":"objrng0"'
> > > > +                         ',"filename":"/dev/urandom"}',
> > > > +                         '-device',
> > > > '{"driver":"virtio-rng-pci","rng":"objrng0"'
> > > > +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> > > > +        self.vm.add_args('-object',
> > > > '{"qom-type":"cryptodev-backend-builtin",'
> > > > +                         '"id":"objcrypto0","queues":1}',
> > > > +                         '-device', '{"driver":"virtio-crypto-pci",'
> > > > +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> > > > +                         ':"pci.0","addr":"0xa"}')
> > > > +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> > > > +                         ',"index":1,"id":"pci.1"}')
> > > > +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
> > > > +                         ',"reg":12288}')
> > > > +        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
> > > > +                         '-object', 'memory-backend-ram,id=ram1,size=1G',
> > > > +                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
> > > > +
> > > > 
> > > 
> > > 
> > > Most of the above code for adding args is getting duplicated in the test
> > > for ppc64le below as well.
> > > It could be contained in a helper routine which could be called from both,
> > > and would be easier to maintain.
> > I kept it separate because there may be some future reason to make the
> > devices different for ppc and ppc64le. I know that probably won't happen
> > but thought to keep it separate to allow for that possibility.
> > Or if you feel that they should be exactly the same maybe I could send
> > another patch after this to refactor the code into a single routine ?
> 
> We can keep a single routine if all the devices are exactly same for now.
> Whenever (or if now) there is a change in device needed, that can be
> conveyed to that routine via a flag for be/le and the routine can add
> additional devices based on the flag passed.
Sure. Made this change and sent a v4.
> 
> > > 
> > > regards,
> > > Harsh
> > > 
> > > +        # Create a temporary qcow2 and launch the test-case
> > > > +        with tempfile.NamedTemporaryFile(prefix='tuxrun_ppc64_',
> > > > +                                         suffix='.qcow2') as qcow2:
> > > > +            process.run(self.qemu_img + ' create -f qcow2 ' +
> > > > +                        qcow2.name + ' 1G')
> > > > +
> > > > +            self.vm.add_args('-drive', 'file=' + qcow2.name +
> > > > +                         ',format=qcow2,if=none,id='
> > > > +                         'drive-virtio-disk1',
> > > > +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> > > > +
> > > >   'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> > > > +                         ',bootindex=2')
> > > > +            self.common_tuxrun(drive="scsi-hd")
> > > > 
> > > >       def test_ppc64le(self):
> > > >           """
> > > >           :avocado: tags=arch:ppc64
> > > >           :avocado: tags=machine:pseries
> > > > -        :avocado: tags=cpu:POWER8
> > > > +        :avocado: tags=cpu:POWER10
> > > >           :avocado: tags=console:hvc0
> > > >           :avocado: tags=tuxboot:ppc64le
> > > >           :avocado: tags=image:vmlinux
> > > >           :avocado: tags=extradev:driver=spapr-vscsi
> > > >           :avocado: tags=root:sda
> > > >           """
> > > > -        self.common_tuxrun(drive="scsi-hd")
> > > > +        # add device args to command line.
> > > > +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0
> > > > -:22',
> > > > +                         '-device', 'virtio-net,netdev=vnet')
> > > > +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> > > > +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> > > > +
> > > >   '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> > > > +                         '"bus":"pci.0","addr":"0x9"}')
> > > > +        self.vm.add_args('-device',
> > > > '{"driver":"qemu-xhci","p2":15,"p3":15,'
> > > > +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> > > > +        self.vm.add_args('-device',
> > > > '{"driver":"virtio-scsi-pci","id":"scsi0"'
> > > > +                         ',"bus":"pci.0","addr":"0x3"}')
> > > > +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
> > > > +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> > > > +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
> > > > +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> > > > +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> > > > +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> > > > +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> > > > +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> > > > +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
> > > > +                         ',"bus":"usb.0","port":"1"}')
> > > > +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> > > > +                         ',"bus":"usb.0","port":"2"}')
> > > > +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> > > > +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> > > > +        self.vm.add_args('-object',
> > > > '{"qom-type":"rng-random","id":"objrng0"'
> > > > +                         ',"filename":"/dev/urandom"}',
> > > > +                         '-device',
> > > > '{"driver":"virtio-rng-pci","rng":"objrng0"'
> > > > +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> > > > +        self.vm.add_args('-object',
> > > > '{"qom-type":"cryptodev-backend-builtin",'
> > > > +                         '"id":"objcrypto0","queues":1}',
> > > > +                         '-device', '{"driver":"virtio-crypto-pci",'
> > > > +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> > > > +                         ':"pci.0","addr":"0xa"}')
> > > > +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> > > > +                         ',"index":1,"id":"pci.1"}')
> > > > +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
> > > > +                         ',"reg":12288}')
> > > > +        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
> > > > +                         '-object', 'memory-backend-ram,id=ram1,size=1G',
> > > > +                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
> > > > +
> > > > +        # Create a temporary qcow2 and launch the test-case
> > > > +        with tempfile.NamedTemporaryFile(prefix='tuxrun_ppc64le_',
> > > > +                                         suffix='.qcow2') as qcow2:
> > > > +            process.run(self.qemu_img + ' create -f qcow2 ' +
> > > > +                        qcow2.name + ' 1G')
> > > > +
> > > > +            self.vm.add_args('-drive', 'file=' + qcow2.name +
> > > > +                         ',format=qcow2,if=none,id='
> > > > +                         'drive-virtio-disk1',
> > > > +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> > > > +
> > > >   'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> > > > +                         ',bootindex=2')
> > > > +            self.common_tuxrun(drive="scsi-hd")
> > > > 
> > > >       def test_riscv32(self):
> > > >           """
> > > > --
> > > > 2.25.1
> > > > 
> > > > 
> > > > 
> 

