Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD66C5369
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:15:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2yf-0006ux-9N; Wed, 22 Mar 2023 14:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pf2yb-0006uf-Qt
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:14:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pf2ya-0000Cr-4q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:14:21 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MICgxJ002564; Wed, 22 Mar 2023 18:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=z0yLq+hy32FOQLpJseIrH4Mt7pTROB+5zSD1/2aV730=;
 b=WB6q59Y/xCMP0gtZ8crcpncrpu2vny/HqcKh18UFS+i3vhuzLIRnlMp00HE/VZPnF7+D
 8KPY3Do7N3yV4qNLPOvuXWapEsRNTgWRchyXWKWDdTn2SczFqBkkSuqT01hkyCWY9MBT
 2u5vtQsLVpt7tpbeBFeKS9ENZcywGc2gZKBHjBSm4Gb5QnxTB7YIE+9ARua3rRKXtqeH
 YdP00wDBWrsA32BkJH8ahxfPnUXe0QKPX3kUyfHN9PsjJVesyxUBKOXbK9YMhqlIm+RZ
 Gq5p+rV0Kzqg6dxp+hGh5QvmVZHpbI3VcB3abYoFjXSwzVEhrXqGx8dbOCq95I8aPcH0 cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg6rdr0xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 18:14:14 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32MIDeGb004869;
 Wed, 22 Mar 2023 18:14:14 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg6rdr0xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 18:14:14 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MHKjX5014964;
 Wed, 22 Mar 2023 18:14:13 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7r09x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 18:14:13 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MIEBDc22414038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 18:14:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 758F858055;
 Wed, 22 Mar 2023 18:14:11 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1736C58043;
 Wed, 22 Mar 2023 18:14:11 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 18:14:11 +0000 (GMT)
Message-ID: <dd43ec84-51e4-11f7-e067-2fb57a567f09@linux.ibm.com>
Date: Wed, 22 Mar 2023 14:14:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, ninadpalsule@us.ibm.com
From: Stefan Berger <stefanb@linux.ibm.com>
Subject: Test for TPM TIS on I2C bus
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rujVzmfc7PDUP12mJQp3hGpapCyWc0ao
X-Proofpoint-ORIG-GUID: WQZVFCvrfxLSWRIFcdB1h1a4fAkyirO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_15,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=969 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220127
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello!

   Ninad wrote an emulator for TPM TIS on I2C bus and I was wondering how one could implement a test case for it so that we can for example read and write registers. All existing TPM test cases are using qtest API and we spawn a thread to emulate a TPM and use the qtest API to read/write the ISA TIS's MMIO registers. The test cases that I see for i2c are all using the qos type of API. I have tried to use both in a test case but I am not sure whether they go together at all (from the errors I have seen they don't go together). So what options would we have? I thought that one could maybe write an i2c driver to transfer bytes to the device but the i2c in hw/i2c/aspeed_i2c.c looks complex to reverse engineer to try to get a byte to a connected device. Do you have any other suggestions?

   Regards,
       Stefan

