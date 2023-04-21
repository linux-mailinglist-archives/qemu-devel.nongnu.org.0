Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC66EA929
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:35:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp2M-00007q-PR; Fri, 21 Apr 2023 07:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppp2K-0008W9-TU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:34:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppp2J-0008GK-8Y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:34:44 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LA0OS8026131; Fri, 21 Apr 2023 11:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BMDVeJvlnhmxBzUAP/bs8DDgLnj9x8phI0yNuEyHzSA=;
 b=JuEB3uJ5uMucXI1WwbJIOZR90489z5mgE7AfIs5SS8gbX82wMMpOF0MzKHXkO9HqI9S0
 e2Fcllvy9IrWjDRuzQ85rEVOiS30/MVdRbDdo6VDLoG6wvRNROoP9Lj6vZt7SS7YprN/
 EdYt/DntRKvDciG6nND0M1HqLRFxS4zXg5AOvaN2nYzP9V7DNJCxElnZQ+FJ7GcdQOC8
 Z5WQ20Y6d/GLcyLfdHH3Xey7sG8vCQ9utyMBd7o9W568++bF2m4p0EiF7V/z4YKHeUus
 w0wB3jcZZVVVL13i9PJyMHxOTVuQ5BUP8VvggxjyhYZg9/G4QQCY5z3GbOcd6QlGxMR8 Jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3e34scp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:34:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LBYXVh032571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:34:33 GMT
Received: from NASANPPMTA01.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 21 Apr 2023 04:34:30 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <alex.bennee@linaro.org>
CC: <bcain@quicinc.com>, <eduardo@habkost.net>, <f4bug@amsat.org>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-devel@nongnu.org>,
 <quic_mathbern@quicinc.com>, <tsimpson@quicinc.com>,
 <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 RESEND 3/7] gdbstub: add support for the qRegisterInfo
 query
Date: Fri, 21 Apr 2023 08:34:20 -0300
Message-ID: <20230421113420.67122-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <87o7nid5mb.fsf@linaro.org>
References: <87o7nid5mb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SkehMlv1xWOxve0Y0FDWfha6RZbzJp-x
X-Proofpoint-GUID: SkehMlv1xWOxve0Y0FDWfha6RZbzJp-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_04,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210099
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SORTED_RECIPS=2.499,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Alex Bennée <alex.bennee@linaro.org> wrote:
>
> > Matheus Tavares <quic_mathbern@quicinc.com> wrote:
> >
> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> > index be18568d0a..f19f8c58c3 100644
> > --- a/gdbstub/gdbstub.c
> > +++ b/gdbstub/gdbstub.c
> > @@ -1578,6 +1599,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
> >          .handler = handle_query_curr_tid,
> >          .cmd = "C",
> >      },
> > +    {
> > +        .handler = handle_query_regs,
> > +        .cmd = "RegisterInfo",
> > +        .cmd_startswith = 1,
> > +        .schema = "l0"
> > +    },
> 
> Where is this defined in the protocol spec, I can't see it in:
> 
>   https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#General-Query-Packets
> 
> and it seems to be information that is handled by the xml register
> description. Is there a reason that isn't used for Hexagon?

Good point. It's actually an lldb extension to the protocol:
https://github.com/llvm/llvm-project/blob/main/lldb/docs/lldb-gdb-remote.txt#L573

But indeed, lldb should be able to use the xml register description as
well. I'll take a look and try to do that instead.

Thanks!

