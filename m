Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174F3B274F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:15:50 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwIeN-000727-E7
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwIcL-0005Xq-AP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:13:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwIcG-0005gh-N3
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:13:36 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O64P7T023216; Thu, 24 Jun 2021 02:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=47ZmoURId4eLW9/jpKzIUVu8lLaQcSbr+zRuya0ejRA=;
 b=beW/6ro/SF5nQdCr4sN/1fDFqHOSXOf/ipGKlsS6As5qmATwr71TtUP++Y2uYmJsaCQ6
 DnTkIJTTTUkeL9/atpoV5pKu6Pvg5UbPtVjOybMJKbMc9MdQH67unzAQZzUGpd2fJbQj
 fTlrLvY2gwTuraXaghWi3zN0YJC+6EMHWehC8VFC7Ee1NC5gn2wPE+bAP4jD32H5hIov
 TkWx6D6BiOE3fRjFefTUibEs3RrqgrLCjv5Z9h3g9OiKc7eF6wCzkVeEWdfFDXtqHqvN
 bkODV2UVU1wPAYioPvd9blvYSuFetgBFOeO/klzRh8m5H/XZKngfQGqhpPLWXZKeceN1 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cmej8ed0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 02:13:26 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15O64VxG023979;
 Thu, 24 Jun 2021 02:13:25 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cmej8ebj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 02:13:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15O61hPf004448;
 Thu, 24 Jun 2021 06:13:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uhab73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:13:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15O6DKcu25821534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 06:13:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83DB2AE057;
 Thu, 24 Jun 2021 06:13:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16B5AE055;
 Thu, 24 Jun 2021 06:13:15 +0000 (GMT)
Received: from [9.160.49.135] (unknown [9.160.49.135])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 06:13:15 +0000 (GMT)
Subject: Re: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-4-philmd@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <af319b1c-4e27-ac58-a3e6-6dac98484779@linux.ibm.com>
Date: Thu, 24 Jun 2021 09:13:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nCFcMBB0pZFJ3JVuUenA5yzy91lh0b6x
X-Proofpoint-ORIG-GUID: _VK3-OkHmtxoZwM3WItSpOqKCdu0oWvU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-23,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240033
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phil,


On 16/06/2021 23:43, Philippe Mathieu-Daudé wrote:
> There is already a section with various SEV commands / types,
> so move the SEV guest attestation together.
> 

I have two questions (regarding several qapi patches in this series):

1. Should we extract all the SEV commands/types to a separate file?
Maybe sev.json, or confidential-guest-sev.json -- anticipating the other
platforms.

2. I see that some qapi types/commands are conditioned on
`defined(CONFIG_...)`. For example in qapi/tpm.json we have:

  { 'command': 'query-tpm-types', 'returns': ['TpmType'],
    'if': 'defined(CONFIG_TPM)' }

I wonder if the same applies to SEV.

-Dov


> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/misc-target.json | 81 +++++++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 81646126267..7db94206212 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -219,6 +219,46 @@
>    'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
>  
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted
> +# Virtualization feature.
> +#
> +# @data:  guest attestation report (base64 encoded)
> +#
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'SevAttestationReport',
> +  'data': { 'data': 'str'},
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-sev-attestation-report:
> +#
> +# This command is used to get the SEV attestation report, and is
> +# supported on AMD X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be
> +#          included in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report",
> +#                  "arguments": { "mnonce": "aaaaaaa" } }
> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##
> +{ 'command': 'query-sev-attestation-report',
> +  'data': { 'mnonce': 'str' },
> +  'returns': 'SevAttestationReport',
> +  'if': 'defined(TARGET_I386)' }
> +
>  ##
>  # @dump-skeys:
>  #
> @@ -285,44 +325,3 @@
>  ##
>  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>    'if': 'defined(TARGET_ARM)' }
> -
> -
> -##
> -# @SevAttestationReport:
> -#
> -# The struct describes attestation report for a Secure Encrypted
> -# Virtualization feature.
> -#
> -# @data:  guest attestation report (base64 encoded)
> -#
> -#
> -# Since: 6.1
> -##
> -{ 'struct': 'SevAttestationReport',
> -  'data': { 'data': 'str'},
> -  'if': 'defined(TARGET_I386)' }
> -
> -##
> -# @query-sev-attestation-report:
> -#
> -# This command is used to get the SEV attestation report, and is
> -# supported on AMD X86 platforms only.
> -#
> -# @mnonce: a random 16 bytes value encoded in base64 (it will be
> -#          included in report)
> -#
> -# Returns: SevAttestationReport objects.
> -#
> -# Since: 6.1
> -#
> -# Example:
> -#
> -# -> { "execute" : "query-sev-attestation-report",
> -                   "arguments": { "mnonce": "aaaaaaa" } }
> -# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> -#
> -##
> -{ 'command': 'query-sev-attestation-report',
> -  'data': { 'mnonce': 'str' },
> -  'returns': 'SevAttestationReport',
> -  'if': 'defined(TARGET_I386)' }
> 

