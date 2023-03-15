Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B266BB77A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSvO-0005BE-MB; Wed, 15 Mar 2023 11:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pcSvI-00053G-Tz
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:20:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pcSvG-0000Bw-0X
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:20:16 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FELRV0014968; Wed, 15 Mar 2023 15:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yA7u5OZcapLJ4JsdAluBVyl3Z+cpJOEq8qOtfIFX290=;
 b=ZOubbHGEVvDzIWR7bWX4jSeERrNS+KAASOaADV6gHyocLkXzJ1dtFPheOWSzconqG7EW
 EBZnL1BAWMNuI8yuZzArm1sopa4a+ExJjlSuFtk+jUG4IfCrI7GfCK7tjs9PTiVcXT2k
 nT82rNbKTsjbWQSw18Fyz/1If65k0EOJ1qM3NXagZIUR8SsYCmYriUesKm498Jm5ZulP
 qeatJp6Slz7FCgSozEqPhUr6gne2DNWUC0MZX/l0qp6/HsKgNXzlKCvM1EdgFZlzGl4c
 SVUDnKYhDa9pql6i9jnrY5pokEHFUjkHMXeE2xTmg1F6nwfZSlom/VDBrMAdcgus6GBJ Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbfq8sub4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 15:19:43 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FEMs4j022803;
 Wed, 15 Mar 2023 15:19:42 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbfq8suah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 15:19:42 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FDsGUQ023527;
 Wed, 15 Mar 2023 15:19:41 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pb29skwcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 15:19:41 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FFJeHn31064522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 15:19:40 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CAA858059;
 Wed, 15 Mar 2023 15:19:40 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 397055805B;
 Wed, 15 Mar 2023 15:19:39 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 15:19:39 +0000 (GMT)
Message-ID: <68816687-b319-7c1a-f586-51201e12ecba@linux.ibm.com>
Date: Wed, 15 Mar 2023 11:19:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] qapi: Do not generate empty enum
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230315111304.21692-1-philmd@linaro.org>
 <20230315111304.21692-3-philmd@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230315111304.21692-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Giv6GIfXDZikqYalUEVy-ruCQtU6g2z
X-Proofpoint-GUID: xJk553K2qK3w96mprz0Q8WUuHQC-uh3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0 mlxlogscore=972
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150126
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



On 3/15/23 07:13, Philippe Mathieu-Daudé wrote:
> Per the C++ standard, empty enum are ill-formed. Do not generate
> them in order to avoid:
> 
>    In file included from qga/qga-qapi-emit-events.c:14:
>    qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>       20 | } qga_QAPIEvent;
>          | ^
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/devel/qapi-code-gen.rst | 6 +++---
>   scripts/qapi/schema.py       | 5 ++++-
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 23e7f2fb1c..d684c7c24d 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -206,6 +206,9 @@ Syntax::
> 
>   Member 'enum' names the enum type.
> 
> +Empty enumeration (no member) does not generate anything (not even
> +constant PREFIX__MAX).
> +
>   Each member of the 'data' array defines a value of the enumeration
>   type.  The form STRING is shorthand for :code:`{ 'name': STRING }`.  The
>   'name' values must be be distinct.
> @@ -214,9 +217,6 @@ Example::
> 
>    { 'enum': 'MyEnum', 'data': [ 'value1', 'value2', 'value3' ] }
> 
> -Nothing prevents an empty enumeration, although it is probably not
> -useful.
> -
>   On the wire, an enumeration type's value is represented by its
>   (string) name.  In C, it's represented by an enumeration constant.
>   These are of the form PREFIX_NAME, where PREFIX is derived from the
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 207e4d71f3..28045dbe93 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -309,6 +309,7 @@ class QAPISchemaEnumType(QAPISchemaType):
> 
>       def __init__(self, name, info, doc, ifcond, features, members, prefix):
>           super().__init__(name, info, doc, ifcond, features)
> +        assert members

not: assert isinstance(members, list)

>           for m in members:
>               assert isinstance(m, QAPISchemaEnumMember)
>               m.set_defined_in(name)
> @@ -1047,8 +1048,10 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
>           return name
> 
>       def _def_enum_type(self, expr: QAPIExpression):
> -        name = expr['enum']
>           data = expr['data']
> +        if not data:
> +            return
> +        name = expr['enum']
>           prefix = expr.get('prefix')
>           ifcond = QAPISchemaIfCond(expr.get('if'))
>           info = expr.info


Acked-by: Stefan Berger <stefanb@linux.ibm.com>

