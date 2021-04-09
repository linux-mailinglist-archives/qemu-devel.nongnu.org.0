Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02035A767
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:50:01 +0200 (CEST)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUx8i-0001Mx-1b
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lUx7d-0000pY-0e; Fri, 09 Apr 2021 15:48:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51260
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lUx7a-0001hl-MK; Fri, 09 Apr 2021 15:48:52 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139JXeOu045700; Fri, 9 Apr 2021 15:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tCe42SR/4LWbPi9nJa9KPh2b/2qEUFjRpQLp7yoNj9g=;
 b=gr2cDHIz78LO5df4W+eEpLEx+lZPopNlj5QCSWyT/DnB1Q1CIPaGb1T95GKNSS1B9lz+
 DvKXCLy1WttXgYKRK4Ka6sUgdQC9qPR21bPXy5ODn/4czli/p4PCzmxcGpf7jkQWDIC4
 kTAGL8+oqM6kReS3ElwTnajP3Cy+6NOK17J1EqBGBBDUPOZZTG+w57HDT833+2Hd+Ts5
 5IuMYHHNN3UtifkQ/E+BJCq+jBtr0IOVRaCT+InkWg1JaA/Q4/8v/52pelMrr/3iiFiL
 4iPmYo5pBO8xasd0wx4tsuf8EMWMtcTiPFj2BKO4ad0AluZi7wFdgpDlczFs8rd6k8tx 2A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37trdqgn6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 15:48:45 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139Jj14x028955;
 Fri, 9 Apr 2021 19:48:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 37ryqcne0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 19:48:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 139Jmi3615073734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 19:48:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B1E07805C;
 Fri,  9 Apr 2021 19:48:44 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B8387805E;
 Fri,  9 Apr 2021 19:48:43 +0000 (GMT)
Received: from localhost (unknown [9.211.99.145])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  9 Apr 2021 19:48:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <20210409151916.97326-2-bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-2-bruno.larsen@eldorado.org.br>
Date: Fri, 09 Apr 2021 16:48:41 -0300
Message-ID: <87h7kf5jdy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hbQhZql6rvduE7uUsd6a3NzEL14t6Wr5
X-Proofpoint-GUID: hbQhZql6rvduE7uUsd6a3NzEL14t6Wr5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_07:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=955
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090141
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: luis.pires@eldorado.org.br, andre.silva@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, "Bruno Larsen
 \(billionai\)" <bruno.larsen@eldorado.org.br>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

A general advice for this whole series is: make sure you add in some
words explaining why you decided to make a particular change. It will be
much easier to review if we know what were the logical steps leading to
the change.

> This commit does the necessary code motion from translate_init.c.inc

For instance, I don't immediately see why these changes are necessary. I
see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
why do we need to move a bunch of code into cpu.c instead of just adding
more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just trying to
understand the reasoning).

Is translate_init.c.inc intended to be TCG only? But then I see you
moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-only
functions (gen_spr_generic).

> This moves all functions that start with gdb_* into target/ppc/gdbstub.c
> and creates a new function that calls those and is called by ppc_cpu_realize

This looks like it makes sense regardless of disable-tcg, could we have
it in a standalone patch?

> All functions related to realizing the cpu have been moved to cpu.c, which
> may call functions from gdbstub or translate_init

Again, I don't disagree with this, but at first sight it doesn't seem
entirely related to disabling TCG.


