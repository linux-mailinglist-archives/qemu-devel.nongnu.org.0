Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E36EA920
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:32:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppoz9-00071s-KI; Fri, 21 Apr 2023 07:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppoz3-0006zf-Is
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:31:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppoz1-0007jL-Qw
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:31:21 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LAm6eh013784; Fri, 21 Apr 2023 11:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xRAe57eXR+IUCk3vzfSyoWw/wwNmBXJ7TbNTf/5J7Qc=;
 b=ZKyjGb+rI7xSVlTIWZqJUpTy3ICa9Pr8+LBhSpI+VBXoWxndTvTIQFMl0oLAMdiB0f/T
 lHLRIrxmdMt9cXM85KbfvGuzCRg+oJ3ku8V4mkUou6RKZs+O/J+WEzl17FRVQjnIp2fB
 /yZH4BTQ0VkgfkwpZaiWnq4FsACf+jKQkY3LN460ow1U4KcD8tVNt9k/cEzTEWrncauM
 CJ32vjtYxt/E1ODSIoMcbfbcnU5nA4hCbwtznVMaEYPo+cYlg0lBqlDky2a7e9UAIBfA
 yQ2pJaDfOeDGKRGE4C7M5HfR47BlWV9/JGAI0WUdoOR9G2BJmt60LPFLScEXLIQls80M NA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3g1rs60g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:31:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LBVEj9023301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:31:14 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 21 Apr 2023 04:31:11 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <alex.bennee@linaro.org>
CC: <bcain@quicinc.com>, <f4bug@amsat.org>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-devel@nongnu.org>,
 <quic_mathbern@quicinc.com>, <tsimpson@quicinc.com>
Subject: Re: [PATCH v2 RESEND 1/7] gdbstub: only send stop-reply packets when
 allowed to 
Date: Fri, 21 Apr 2023 08:31:01 -0300
Message-ID: <20230421113101.64460-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <87wn26d5zs.fsf@linaro.org>
References: <87wn26d5zs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eQNhtsenytEHfucDUDz-J65vXi5ZlnkO
X-Proofpoint-ORIG-GUID: eQNhtsenytEHfucDUDz-J65vXi5ZlnkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_04,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=722 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210099
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> > diff --git a/gdbstub/user.c b/gdbstub/user.c
> > index 80488b6bb9..bb03622c83 100644
> > --- a/gdbstub/user.c
> > +++ b/gdbstub/user.c
> > @@ -174,12 +177,14 @@ void gdb_signalled(CPUArchState *env, int sig)
> >  {
> >      char buf[4];
> >  
> > -    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
> > +    if (!gdbserver_state.init || gdbserver_user_state.fd < 0 ||
> > +        !gdbserver_state.allow_stop_reply) {
> >          return;
> >      }
> >  
> >      snprintf(buf, sizeof(buf), "X%02x", gdb_target_signal_to_gdb(sig));
> >      gdb_put_packet(buf);
> > +    gdbserver_state.allow_stop_reply = false;
> 
> Did I miss an equivalent for softmmu mode here?

Hmm, there doesn't seem to be other "X aa" stop-replies sent from
softmmu in our gdbstub. However, I just realize I did miss another spot
of "W aa" at gdbstub/user.c:gdb_exit(). I'll add the allow_stop_reply
guard there for the next iteration.

