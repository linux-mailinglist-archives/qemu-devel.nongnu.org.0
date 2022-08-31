Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF15A7F5F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:57:11 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTODO-0004NN-G6
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oTOAx-00021G-81
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:54:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:51598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oTOAv-0003Lg-5k
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:54:38 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VDTDk4016324;
 Wed, 31 Aug 2022 13:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=Y9TavTXhflwewAbNN35tp82NzmG95M3FXzlEjNbIofA=;
 b=hZQ/vmvnMslGmvkWonko7/JULd0rCfhKEPngL51Ujw8qAM5mWmxc7rFDpfmw2/Wt11XK
 MxAc44YM8QUcsCDkoa+H58G4JNzpEAan3t5VnwJoM59mi+1WY7c038rbq5lA8dmeLlMf
 8f9hb9nV+XJwMwG9KLfDe17Zp8cxUN3vFXR2huuKrGPft2kLH2UbbHGxHQ73pThy+mQ/
 Uatg92SjS3h3La14pjMVLNjdi3oQq+5hAZ8LCTbRVAbg/g1yAQNOTSF7tiNpnHFx6Yyo
 VM8qIlUaVqMBciJehjmxN+UhfAO0FXAAGQg52wC+PyePjwwXpOdrzWvrKnBvAMvyyHSK /g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9mwg3jht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 13:54:30 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27VDsU7V007086
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 13:54:30 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 07B5C6F8; Wed, 31 Aug 2022 10:54:30 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org
Subject: Re: [RFC PATCH v2] gdbstub: only send stop-reply packets when allowed
 to
Date: Wed, 31 Aug 2022 10:54:13 -0300
Message-Id: <7d14967366c0e3640f47a15e80d1cc911413cadb.1661946575.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
References: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fXqMTg-PtHBpBI-zWrY5IWPDw6_Ks6vD
X-Proofpoint-GUID: fXqMTg-PtHBpBI-zWrY5IWPDw6_Ks6vD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=487 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208310070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Wed, 24 Aug 2022 at 14:51, Matheus Tavares Bernardino <quic_mathbern@quicinc.com> wrote:
>
> Instead, let's change gdb_set_stop_cpu() to send stop messages only as a
> response to a previous GDB command, also making sure to check that the
> command accepts such a reply.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---

Gentle ping :)

Any feedback will be highly appreciated.

