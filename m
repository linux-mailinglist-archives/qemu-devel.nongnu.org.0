Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E86CBDCB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:32:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7YP-0004rp-Pg; Tue, 28 Mar 2023 07:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph7YO-0004rY-6n
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:31:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph7YM-0002tf-9o
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:31:51 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SBKVGl033022; Tue, 28 Mar 2023 11:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=guyJItfsuPy5dE8ViUEsRdo9fqoeNCgdWwY26dFTdoQ=;
 b=NMwuVJUgqM39bGTLnF8CetGNjplWIcL7MMPVrN+f6nuXd9g5aVa+n/eN0Wwgx8l+kCmQ
 Kqro6C1e6bhQahVI6I7lodiz0o0640aMZMpYx56HfA6DeEBaXmyNvMnqWAnP+3r9pSID
 AICessRaGcxuCoCTwTuUyCaQtkbfjXC1Xqj2O2RWMlb2uDmQDwZYs0De27cC8OjlTFs3
 RsI8JxDUsFvru9gcx5Y+bi0l5DTup2TOnW5dQLiUwDRY4yKl7PTozyWn17kpc8KuvhS0
 1O6v/JUbW4XUGzf6sEME7oB1wYtzkWcagx7IyHQvfdEwOpxCyhJh4GmZn9hszjKVHzce 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f0709-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:31:39 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SBOlsE002920;
 Tue, 28 Mar 2023 11:31:39 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f06yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:31:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SAmnsu029105;
 Tue, 28 Mar 2023 11:31:38 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk74ce2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:31:38 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SBVaBo19071482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 11:31:37 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C77E58063;
 Tue, 28 Mar 2023 11:31:36 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F88958069;
 Tue, 28 Mar 2023 11:31:36 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 11:31:36 +0000 (GMT)
Message-ID: <f947d10a-4edd-1376-cea9-cdc5dae216f8@linux.ibm.com>
Date: Tue, 28 Mar 2023 07:31:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] qtest: Add a test case for TPM TIS I2C connected to
 Aspeed I2C controller
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, ninad@linux.ibm.com, joel@jms.id.au,
 andrew@aj.id.au
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-4-stefanb@linux.ibm.com>
 <50f67d0d-18f8-dead-9716-cd94b24915a6@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <50f67d0d-18f8-dead-9716-cd94b24915a6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lb9BS7rfXhhzDuA5NfsJ1F4b_AxBPOko
X-Proofpoint-GUID: Svs4Unvdn09IwmM1e327O56Vo4Z83sJn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280094
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/28/23 05:17, Cédric Le Goater wrote:
>> +static void tpm_tis_i2c_test_basic(const void *data)
>> +{
>> +    uint8_t access;
>> +    uint32_t v;
>> +
>> +    /*
>> +     * All register accesses below must work without locality 0 being the
>> +     * active locality. Therefore, ensure access is released.
>> +     */
>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS,
>> +                       TPM_TIS_ACCESS_ACTIVE_LOCALITY);
>> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
>> +    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
>> +                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
>> +
>> +    /* read interrupt capability -- none are supported */
>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_CAPABILITY);
>> +    g_assert_cmpint(v, ==, 0);
>> +
>> +    /* try to enable all interrupts */
>> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0xffffffff);
>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
>> +    /* none could be enabled */
>> +    g_assert_cmpint(v, ==, 0);
>> +
>> +    /* enable csum */
>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
>> +    /* check csum enable register has bit 0 set */
>> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
>> +    /* reading it as 32bit register returns same result */
>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
>> +
>> +    /* disable csum */
>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, 0);
>> +    /* check csum enable register has bit 0 clear */
>> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>> +    g_assert_cmpint(v, ==, 0);
>> +
>> +    /* write to unsupported register '1' */
>> +    tpm_tis_i2c_writel(0, 1, 0x12345678);
>> +    v = tpm_tis_i2c_readl(0, 1);
>> +    g_assert_cmpint(v, ==, 0xffffffff);
>> +}
> 
> I am seeing some errors :


There's a small fix to apply to 3/3 of Ninad's patches. See my comment here:


https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg06464.html

     Stefan
> 
> $ QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm  tests/qtest/tpm-tis-i2c-test
> # random seed: R02S68cdeb5a9a7b97eed594a7792b6aa7ff
> # starting QEMU: exec arm-softmmu/qemu-system-arm -qtest unix:/tmp/qtest-1981218.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1981218.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine rainier-bmc -accel tcg -chardev socket,id=chr,path=/tmp/qemu-tpm-tis-i2c-test.DFGN21/sock -tpmdev emulator,id=tpm0,chardev=chr -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.10,address=0x2e -accel qtest
> # GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be used after threads are created
> qemu-system-arm: warning: Aspeed iBT has no chardev backend
> 1..6
> # Start of arm tests
> # Start of tpm-tis-i2c tests
> **
> ERROR:../tests/qtest/tpm-tis-i2c-test.c:130:tpm_tis_i2c_test_basic: assertion failed (v == 0): (1 == 0)
> Bail out! ERROR:../tests/qtest/tpm-tis-i2c-test.c:130:tpm_tis_i2c_test_basic: assertion failed (v == 0): (1 == 0)
> Unexpected error in qio_channel_socket_writev() at ../io/channel-socket.c:621:
> qemu-system-arm: tests/qtest/tpm-tis-i2c-test:tpm-emulator: Could not cleanly shutdown the TPM: Interrupted system call
> Unable to write to socket: Bad file descriptor
> Aborted (core dumped)
> 

