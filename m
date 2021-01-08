Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8082EFB81
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:59:27 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0j8-0006lX-DV
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1ky0c1-00064L-Kn
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61872
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1ky0bu-0007vT-EY
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:05 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 108MWwQc034236; Fri, 8 Jan 2021 17:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=y/gE/uXod8Rbc26MIMC3fKw1SyMN0UHnGfZLjL33nxk=;
 b=Kdm9eZjReDKsDtxlsm2HRtQRohuzRkP53NEETd34BdQZxD4kYou3nWey/PJz3BnNa2WS
 E8p3ozkODmAXaq0bvFC79Ltl6g/yuXM7izDsgibdrerMpaXl12dKPGEWbZfkwo9angWJ
 9G0MesRMw4WXtLAia8IsFgHyl8X5PNzNwXPF7cb0hksfvKtCeiNav/mMxNxroyk8mWuu
 9O7FXvtd0x57HS0sAOLlrZNAOnPkZLHWL/3PNFrYksnNNdDHrqaMMNMK/1HRijqa4AZq
 oq8/hU5lFe411U3b1JX9MwIgwd3mbMHjIHrNtvwkEBW/KmvCTqhjO6DYFmgSW2bLon3M Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35xyyyrq6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jan 2021 17:51:44 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 108MfXOL066027;
 Fri, 8 Jan 2021 17:51:44 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35xyyyrq6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jan 2021 17:51:44 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 108Mm3WF007716;
 Fri, 8 Jan 2021 22:51:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 35tgf9trm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jan 2021 22:51:43 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 108Mpgfu21102960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jan 2021 22:51:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AA176A054;
 Fri,  8 Jan 2021 22:51:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B87AF6A047;
 Fri,  8 Jan 2021 22:51:41 +0000 (GMT)
Received: from [9.160.3.101] (unknown [9.160.3.101])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jan 2021 22:51:41 +0000 (GMT)
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210108151632.277015-1-f4bug@amsat.org>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <2cde5504-9df6-93fb-a014-daee2b907fde@linux.vnet.ibm.com>
Date: Fri, 8 Jan 2021 17:51:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108151632.277015-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-08_11:2021-01-07,
 2021-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101080113
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a similar issue in the past with the acceptance tests.
Some VMs send UTF-8 output in their console and the acceptance test
script would bail out if the locale was not UTF-8.

I sent a patch on the ml but it probably got lost:
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg06086.html

I can re-spin it if you guys are interested


On 1/8/2021 10:16 AM, Philippe Mathieu-Daudé wrote:
> When decodetree.py was added in commit 568ae7efae7, QEMU was
> using Python 2 which happily reads UTF-8 files in text mode.
> Python 3 requires either UTF-8 locale or an explicit encoding
> passed to open(). Now that Python 3 is required, explicit
> UTF-8 encoding for decodetree sources.
> 
> This fixes:
> 
>    $ /usr/bin/python3 scripts/decodetree.py test.decode
>    Traceback (most recent call last):
>      File "scripts/decodetree.py", line 1397, in <module>
>        main()
>      File "scripts/decodetree.py", line 1308, in main
>        parse_file(f, toppat)
>      File "scripts/decodetree.py", line 994, in parse_file
>        for line in f:
>      File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>        return codecs.ascii_decode(input, self.errors)[0]
>    UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
>    ordinal not in range(128)
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   scripts/decodetree.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..fa40903cff1 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1304,7 +1304,7 @@ def main():
> 
>       for filename in args:
>           input_file = filename
> -        f = open(filename, 'r')
> +        f = open(filename, 'r', encoding='utf-8')
>           parse_file(f, toppat)
>           f.close()
> 

