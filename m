Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1C49B81F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:00:09 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOEp-00008E-UE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:00:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCNDo-00008T-Kw
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:55:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCNDm-0003OP-Nr
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:55:00 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PEjuGh031767; 
 Tue, 25 Jan 2022 14:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Zw/loyjbTJxxS1KmfvpvDiOMIK7PqnEtAuLCUVE1xtU=;
 b=G2JeIe/LF2cpEiLor6snigKTnwaQKwx1+xbYwinhT2fAjy70G+BwzAVHLrH7RVqHF5sq
 hZw61qnmNtrtxoEGwtu/r0Uo+Olgoa3PLUqvBuG47Jc+zVDsg240khTFdAr4Hf0+7hNl
 r8whSFh76h10sg2U/nptOpWqnIU5zcc6BRW3UPO+xy5ExUzECDUc6TAvW/op4zy8YJe1
 6wYFFLp39+H48KrH+MdOdWkf97HlCb7E4Vb3UQFoj6AiO/h0EfNy6cZkLlPbjkxT2urc
 /iya1LoBxP1my9iEd7IRESpntEP7C3Nm72YnvdQ7t0+YKuziWYf6ZAvQM6+L3m0IvVim JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtjrt8u7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:57 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PEnJiQ008561;
 Tue, 25 Jan 2022 14:54:56 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtjrt8u7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:56 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PEmKfm028083;
 Tue, 25 Jan 2022 14:54:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3dr96jf9x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PEsqtW35258672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:54:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85D7842045;
 Tue, 25 Jan 2022 14:54:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2194204B;
 Tue, 25 Jan 2022 14:54:52 +0000 (GMT)
Received: from li-ca45c2cc-336f-11b2-a85c-c6e71de567f1.ibm.com (unknown
 [9.171.17.160])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 14:54:52 +0000 (GMT)
Message-ID: <c0b5e6151a330f58f6794ee4fac19e6319810613.camel@linux.ibm.com>
Subject: Re: [PATCH qemu] s390x: sck: load into a temporary not into in1
From: Nico Boehr <nrb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 25 Jan 2022 15:54:52 +0100
In-Reply-To: <9a888391-1020-89b0-65ed-5c93f2cc8642@redhat.com>
References: <20220125122914.567599-1-nrb@linux.ibm.com>
 <9a888391-1020-89b0-65ed-5c93f2cc8642@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j2mzPcFZN9am7iyrCWArefBvGfbUP5Gq
X-Proofpoint-GUID: FevJGd15Wo6BZrRBkyPBBot0I4tDtrOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=917 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250094
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nrb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-01-25 at 14:13 +0100, David Hildenbrand wrote:
> I think you can actually just reuse in2_m2_64a, similar as we handle
> SCKC

I tried my SCK tests with your patch, it works just as well and seems
much cleaner, thanks.

Do you want to send this or should I make a v2 and add you as
Suggested-by?

