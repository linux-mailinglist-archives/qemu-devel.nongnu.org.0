Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71166EA975
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:41:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp8F-0006H6-3T; Fri, 21 Apr 2023 07:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppp8B-0006Gt-By
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:40:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppp89-00019F-GL
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:40:47 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LBFGHp013989; Fri, 21 Apr 2023 11:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i7nPx5rTQfhSu9JReAvNfjC36EQC0wYtWVlvF/kzhRw=;
 b=h0mLt2Q+mBpWg6CHpPp0Wr0nBHL0b9DWwCIfh0ss9xQ3zDY0cGuhYqpV2CnIqWUsYBAr
 KoMx1dkqsZiAwHKKyiXNL7H+rlHkz4q0dUk6LnAqVszoCuHTLZZQXon6m5uMBhQBN1Eu
 hbZmJrTiYu+c3Q1p3AouVWUv6uH6E0sc4Uo76nFYdYPHEFyeWoJ1LUovR/50IY1SpVa1
 uzpX6NYBQ5lDatzBq8REyvUby3agHjOPF1ILA+paze089RqSK9NTyIoBWrDUKU25xw5F
 NzweBAX6AyIRyNZ5LVzbYrCrp8W2ACuG7UX4PHNHctyqRatGpw28w9hyturWn5yM/G16 FQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3qdm89sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:40:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LBeeuL002815
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:40:40 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 21 Apr 2023 04:40:37 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <philmd@linaro.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 <quic_mathbern@quicinc.com>, <tsimpson@quicinc.com>
Subject: Re: [PATCH v2 RESEND 4/7] Hexagon: support qRegisterInfo at gdbstub
Date: Fri, 21 Apr 2023 08:40:16 -0300
Message-ID: <20230421114016.69620-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <ac914968-c26e-c97c-640e-2b08946f819a@linaro.org>
References: <ac914968-c26e-c97c-640e-2b08946f819a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 86lZOlCjvKbd-WY57iGv7smgRuPxdQvV
X-Proofpoint-GUID: 86lZOlCjvKbd-WY57iGv7smgRuPxdQvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_05,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=789 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210101
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>
> > Matheus Tavares <quic_mathbern@quicinc.com> wrote:
> > 
> > diff --git a/target/hexagon/gdb_qreginfo.h b/target/hexagon/gdb_qreginfo.h
> > new file mode 100644
> > index 0000000000..64631ddd58
> > --- /dev/null
> > +++ b/target/hexagon/gdb_qreginfo.h
> 
> This should be gdb_qreginfo.h.inc

Ok, thanks.

> > @@ -358,6 +359,8 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
> >       cc->get_pc = hexagon_cpu_get_pc;
> >       cc->gdb_read_register = hexagon_gdb_read_register;
> >       cc->gdb_write_register = hexagon_gdb_write_register;
> > +    cc->gdb_qreg_info_lines = (const char **)hexagon_qreg_descs;
> 
> No need to cast if fixing gdb_qreg_info_lines's prototype
> (see previous patch review).

Ah, good call, thanks. I'll try to avoid the whole qRegisterInfo
implemenation in the next round, as Alex suggested [1]. But if not
possible, I'll make sure to add this changes to the types and cast.
Thanks!

[1]: https://lore.kernel.org/qemu-devel/20230421113420.67122-1-quic_mathbern@quicinc.com/

