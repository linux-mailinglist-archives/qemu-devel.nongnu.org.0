Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA641D0BA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:46:22 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkDN-0003lF-Ih
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVk9y-0002P0-6Y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:42:50 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:53654
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVk9v-0004uE-Pp
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:42:49 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 18TNkuAh027618
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:42:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=ZuAplDxR/ACtWqTc39JeQ4g/iCuC/h3MRE45+fHRA74=;
 b=UM9+CMR/PNmmfzZMFObmFZqr+oY8/CV5KDoE6pR7OmrVNVa4QH5gXZ22l6OR3AndH5Rb
 ZjRCX9+4TVEm2YRdaH64GN3fKERKOdLxSsEUh2twEbJx9UWLHxydhUAZy6bjn0h1Yeab
 EwmO/zlSH3sM8/I5V06lw6UmpCW/ASriWBk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 3bcbfm9mb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:42:41 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 17:42:40 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id AACF64846226; Wed, 29 Sep 2021 17:42:38 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <patrick@stwcx.xyz>, <amithash@fb.com>, <zhdaniel@fb.com>, 
 <qemu-devel@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [RFC PATCH 0/1] hw: aspeed_adc: Add initial Aspeed ADC support
Date: Wed, 29 Sep 2021 17:42:34 -0700
Message-ID: <20210930004235.1656003-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 2O0VHGXQ_KzgzBWEOnezrGBGc6Oo4Ebz
X-Proofpoint-ORIG-GUID: 2O0VHGXQ_KzgzBWEOnezrGBGc6Oo4Ebz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_09,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=598
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300001
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9907073e8e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

Hey everyone,

This patch mostly just does the basic, boilerplate setup for the ADC, so
that we can start adding more ADC feature emulation in the future.

The only device behavior that I tried to add was emulating the control
initialization sequence and the sequence for enabling "Auto compensating
sensing mode". I didn't even use something like a timer to delay the
response for each register write by a few cycles, it just immediately
updates the register.

I was looking at the Nuvoton ADC model, "hw/adc/npcm7xx_adc.c", and I
noticed that it has "enter_reset" and "hold_reset" methods, should I
implement the initialization sequence as part of the "Resettable"
interface? (It seems like I probably should, I'm just not really sure).

I could also add a timer to emulate the time it takes to initialize the
ADC, I see the Nuvoton module also has a constant
"NPCM7XX_ADC_RESET_CYCLES" but it's not used anywhere, but I imagine I
could do something similar to the conversion timer in that module?  I
think the upstream drivers poll every 0.5 ms and timeout after 500 ms,
so I could use that as a guide.

This patch, even without any conversion emulation, is useful to me
because some OpenBMC platforms use Aspeed SDK ADC drivers, and they
don't have error handling if the ADC doesn't respond, so they can't boot
in QEMU without some basic emulation like this.

Thanks,
Peter

Peter Delevoryas (1):
  hw: aspeed_adc: Add initial Aspeed ADC support

 hw/adc/aspeed_adc.c         | 205 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   4 +
 hw/arm/aspeed_ast2600.c     |  18 ++++
 hw/arm/aspeed_soc.c         |  17 +++
 include/hw/adc/aspeed_adc.h |  48 +++++++++
 include/hw/arm/aspeed_soc.h |   5 +
 7 files changed, 298 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

--=20
2.30.2


