Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612E6CAB21
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:57:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgq9U-0006vb-Kd; Mon, 27 Mar 2023 12:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgq9M-0006uj-UH
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:56:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgq9K-0001Sa-Qa
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:56:52 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RG41Sp028078; Mon, 27 Mar 2023 16:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rdVJJUakW1WcfKZiriqKTpWSnt1XkXSG75IAzR6lNb0=;
 b=sAD5XGjfL4TD/+5MtwAXiK3whdOiQTWmLYxcU/2PajBveuA/tkQzIQrPjMFgDsNQns51
 i7SNq3oCpFo+sEVEXBJxhwhasJkbRz2ceJTezP+vF7XrJ6A0VFVlX0ArU6dcjFLsnGtw
 HZSD39oLeg4MtOQC/e29u9cX9rRB9btbfqdpph3pXtrBPSk64BMqN87MHFflyi5Wicqo
 ToNYG14jVXF9HpULeIgDK3xlvX04z3SAMaMn/p+gWJV6PNt522Gf59MyLxgCTSY6aXl/
 W/Ry40+0hoLuS0jRsa+ZDt+D4bI31L37bLitbGQ0pBTlwExqQE05DcMQInSANIoWCm9d Iw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkeb294hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:56:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDf4NL005787;
 Mon, 27 Mar 2023 16:56:40 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6v7m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:56:40 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RGucRM28115534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 16:56:39 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8A5E58061;
 Mon, 27 Mar 2023 16:56:38 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E1DF58058;
 Mon, 27 Mar 2023 16:56:38 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 16:56:38 +0000 (GMT)
Message-ID: <bf00c620-c510-0854-8cac-71e876387c3f@linux.ibm.com>
Date: Mon, 27 Mar 2023 12:56:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230327161622.3979396-1-ninad@linux.ibm.com>
 <20230327161622.3979396-4-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230327161622.3979396-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rSCE1GlDnrhowJjyzEUg1ybl-W9vVSka
X-Proofpoint-ORIG-GUID: rSCE1GlDnrhowJjyzEUg1ybl-W9vVSka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303270133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 3/27/23 12:16, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices. I2C model only supports
> TPM2 protocol.
> 


> + * If data is for FIFO then it is received from tpm_tis_common buffer
> + * otherwise it will be handled using single call to common code and
> + * cached in the local buffer.
> + */
> +static uint8_t tpm_tis_i2c_recv(I2CSlave *i2c)
> +{
> +    int          ret = 0;
> +    uint32_t     data_read;
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
> +    TPMState    *s = &i2cst->state;
> +    uint16_t     i2c_reg = i2cst->data[0];
> +
> +    if (i2cst->operation == OP_RECV) {
> +
> +        /* Do not cache FIFO data. */
> +        if (i2cst->data[0] == TPM_I2C_REG_DATA_FIFO) {
> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 1);
> +            ret = (data_read & 0xff);
> +        } else if (i2cst->offset < sizeof(i2cst->data)) {
> +            ret = i2cst->data[i2cst->offset++];
> +        }
> +
> +    } else if ((i2cst->operation == OP_SEND) && (i2cst->offset < 2)) {
> +        /* First receive call after send */
> +
> +        i2cst->operation = OP_RECV;
> +
> +        switch (i2c_reg) {
> +        case TPM_I2C_REG_LOC_SEL:
> +            /* Location selection register is managed by i2c */
> +            i2cst->data[1] = i2cst->loc_sel;
> +            break;
> +        case TPM_I2C_REG_DATA_FIFO:
> +            /* FIFO data is directly read from TPM TIS */
> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 1);
> +            i2cst->data[1] = (data_read & 0xff);
> +            break;
> +        case TPM_I2C_REG_DATA_CSUM_ENABLE:
> +            i2cst->data[1] = i2cst->csum_enable;
> +            break;
> +        case TPM_I2C_REG_INT_CAPABILITY:
> +            /* Interrupt itpm_tis_read_data(s, i2cst->tis_addr, 1);s not supported as there is not way to test it. */
We can test that this register returns the right values. What we cannot test is running this model with interrupts.


> +            i2cst->data[1] = TPM_I2C_INT_ENABLE_MASK;
> +            i2cst->data[2] = TPM_I2C_INT_ENABLE_MASK;
> +            i2cst->data[3] = TPM_I2C_INT_ENABLE_MASK;
> +            i2cst->data[4] = TPM_I2C_INT_ENABLE_MASK;

If you map the register in the table above you could do:

data_read = tpm_tis_read_data(s, i2cst->tis_addr, 1);
tpm_tis_i2c_set_data(data_read & TPM_I2C_INT_ENABLE_MASK);

Now that it's used in 3 locations the followig funtion would make sense:

static void tpm_tis_i2c_set_data(uint32_t data) {
     i2cst->data[1] = data;
     i2cst->data[2] = data >> 8;
     i2cst->data[3] = data >> 16;
     i2cst->data[4] = data >> 24;
}


Otherwise if you don't want to map it just call

tpm_tis_i2c_set_data(0);


> +            break;
> +        case TPM_I2C_REG_DATA_CSUM_GET:
> +            /*
> +             * Checksum registers are not supported by common code hence
> +             * call a common code to get the checksum.
> +             */
> +            data_read = tpm_tis_get_checksum(s);
> +
> +            /* Save the byte stream in data field */
> +            i2cst->data[1] = (data_read & 0xff);
> +            i2cst->data[2] = ((data_read >> 8) & 0xff);

tpm_tis_i2c_set_data(data_read);


> +            break;
> +        default:
> +            data_read = tpm_tis_read_data(s, i2cst->tis_addr, 4);
> +
> +            switch (i2c_reg) {
> +            case TPM_I2C_REG_INTF_CAPABILITY:
> +                /* Prepare the capabilities as per I2C interface */
> +                data_read = tpm_i2c_interface_capability(i2cst,
> +                                                         data_read);
> +                break;
> +            case TPM_I2C_REG_STS:
> +                /*
> +                 * As per specs, STS bit 31:26 are reserved and must
> +                 * be set to 0
> +                 */
> +                data_read &= TPM_I2C_STS_READ_MASK;
> +                break;
> +            }
> +
> +            /* Save byte stream in data[] */
> +            i2cst->data[1] = data_read;
> +            i2cst->data[2] = data_read >> 8;
> +            i2cst->data[3] = data_read >> 16;
> +            i2cst->data[4] = data_read >> 24;

tpm_tis_i2c_set_data(data_read);

> +            break;
> +        }
> +

The rest looks good.

