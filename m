Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379692B3172
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 00:46:10 +0100 (CET)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ke5FB-0003R8-9c
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 18:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5DM-0002Sp-86
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:44:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59618
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5DI-0005DT-Rs
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:44:15 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AENVGdm102359; Sat, 14 Nov 2020 18:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XSA2rJegU7LYMMlPnE8IbID3CXQd/B/uAEyz3IwwdY0=;
 b=VH7N4KYVjzJi3W/U77/wcJQvP439HzcU9v5X6cdP+pu89fGf71uGot9QZNcKw6B1bMaY
 kpN3TRrn2RJ3iut1J759PHLL+KTwMFoTnLIFQSvhMydJAzJ/50v57wzyTu7xsVKICs6e
 vUcKcZu2Qy5pFF/eSJIGjo/OfHMpztQftGYPxUSrIrYBe7VeDEPl3Pg2+YT4UN/ftG6p
 qEQl9UJwnIUPKR2dCWkT1T0A5oo/8XO5/ValIMvqkISo6//h3MUjwJjePlt95h/6uQC/
 otTdH9DPn74BIrkpQLL3nR9J8Oy/Qm7n30J1lbtjAwhSDTxtyECP+yfWh1JQNljH+2uj ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34tq2s9vq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:44:11 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AENeVo5127243;
 Sat, 14 Nov 2020 18:44:10 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34tq2s9vq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:44:10 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AENfYd7016199;
 Sat, 14 Nov 2020 23:44:10 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34t6v8p08s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 23:44:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AENi85P27984256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Nov 2020 23:44:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0972BE053;
 Sat, 14 Nov 2020 23:44:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0982EBE054;
 Sat, 14 Nov 2020 23:44:07 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 14 Nov 2020 23:44:07 +0000 (GMT)
Subject: Re: [PATCH 2/4] configure: Do not build pc-bios/optionrom on Haiku
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-3-thuth@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <b1fab224-f6e0-7178-2e33-41f24b0c667a@linux.ibm.com>
Date: Sat, 14 Nov 2020 18:44:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201114165137.15379-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-14_08:2020-11-13,
 2020-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011140156
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 18:43:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/20 11:51 AM, Thomas Huth wrote:
> Compilation of pc-bios/optionrom fails on Haiku with:
>
>     BUILD   pvh.img
>   ld: pvh_main.o: in function `pvh_load_kernel':
>   pc-bios/optionrom/pvh_main.c:73: undefined reference to `GLOBAL_OFFSET_TABLE_'
>   Makefile:57: recipe for target 'pvh.img' failed
>   make[1]: *** [pvh.img] Error 1
>
> Let's simply disable it, like it is already done on macOS and Solaris.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index a273a93377..c0acda164d 100755
> --- a/configure
> +++ b/configure
> @@ -5842,7 +5842,7 @@ fi
>   roms=
>   if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>           test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
> -        test "$softmmu" = yes ; then
> +        test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
>       # Different host OS linkers have different ideas about the name of the ELF
>       # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
>       # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


