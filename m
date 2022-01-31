Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF84A4D78
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:47:03 +0100 (CET)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEala-0001mj-I0
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:47:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nEaDF-0002Nl-Bg; Mon, 31 Jan 2022 12:11:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nEaDD-0000J5-G3; Mon, 31 Jan 2022 12:11:32 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VGcVaG030612; 
 Mon, 31 Jan 2022 17:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SJjX+utx91flrVemIkk+0LE7QlOzmZ4dU3ztZGiQUiI=;
 b=NVkasqt4QoeN1ThAuqdP2OEAGh+LOWGmhFj1YcxKjLJQ9nUXdkWPpxc5FiAvm6l5XgsQ
 C1hSWbhSDluFtlcLQ6p67u2EsllvPVRJGWoCLxTtMW33guqhViEfWbwpitDAGpg/o9O+
 yyajBP2wExZottiIPuG6Ar+9/fkC50YCuCTkiuorZMEma63Hf9CGa3mfA15ekd+kOb4S
 WlbX5ufSgPfuDpDyTQ5uTLIi+5RlmEmE9cRUVqXu5ZofyW7r5U4PNdhOM5T2cmBHdwgx
 CsFKkpfV1LzaiPXBjxKa0+YJBTyZAyrJtiHt63Ma3e8iPeV8B84VPvu9lqjbIUtZV+rn yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdu6sdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:11:29 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VGxUmS027274;
 Mon, 31 Jan 2022 17:11:29 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdu6scc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:11:29 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VH9euV014323;
 Mon, 31 Jan 2022 17:11:28 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3dvw76yhcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:11:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VHBPx233751438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 17:11:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03222124058;
 Mon, 31 Jan 2022 17:11:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF2A124055;
 Mon, 31 Jan 2022 17:11:21 +0000 (GMT)
Received: from [9.211.82.52] (unknown [9.211.82.52])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 17:11:20 +0000 (GMT)
Message-ID: <d2e5a64b-1e46-79b5-5bfc-a884f3b24fb3@linux.ibm.com>
Date: Mon, 31 Jan 2022 12:11:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/9] s390x/pci: enable for load/store intepretation
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-5-mjrosato@linux.ibm.com>
 <799e6d4c-57f4-c321-4c96-d6186cfb3136@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <799e6d4c-57f4-c321-4c96-d6186cfb3136@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JNwaig2NCe7PpSU1G6K9wP7hh2etp0xZ
X-Proofpoint-ORIG-GUID: 7GuV6TFq3f91xO7sBcUM8t8O2PVKD65T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201310111
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 9:46 AM, Pierre Morel wrote:
> 
> 
> On 1/14/22 21:38, Matthew Rosato wrote:
>> Use the associated vfio feature ioctl to enable interpretation for 
>> devices
>> when requested.  As part of this process, we must use the host function
>> handle rather than a QEMU-generated one -- this is provided as part of 
>> the
>> ioctl payload.
> 
> I wonder if we should not explain here that having interpretation as a 
> default and silently fall back to interception allows backward 
> compatibility while allowing performence be chosing by default.
> (You can say it better as I do :) )

Good suggestion, I'll think of something to add to the commit message.


>> @@ -1022,12 +1068,33 @@ static void s390_pcihost_plug(HotplugHandler 
>> *hotplug_dev, DeviceState *dev,
>>           set_pbdev_info(pbdev);
>>           if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
>> -            pbdev->fh |= FH_SHM_VFIO;
>> +            /*
>> +             * By default, interpretation is always requested; if the 
>> available
>> +             * facilities indicate it is not available, fallback to the
>> +             * intercept model.
> 
> s/intercept/interception/ ?
> 

OK

>> +             */
>> +            if (pbdev->interp && 
>> !s390_has_feat(S390_FEAT_ZPCI_INTERP)) {
>> +                    DPRINTF("zPCI interpretation facilities 
>> missing.\n");
>> +                    pbdev->interp = false;
>> +                }
>> +            if (pbdev->interp) {
>> +                rc = s390_pci_interp_plug(s, pbdev);
>> +                if (rc) {
>> +                    error_setg(errp, "zpci interp plug failed: %d", rc);
>> +                    return;
>> +                }
>> +            }
> 
> 
> Can't we rearrange that as
> if (pbdev->interp) {
>      if (s390_has_feat) {
>      } else {
>      }
> }

Yep, sure

...

> 
> LGTM
> With the corrections proposed by Thomas.
> Mine... you see what you prefer.
> 
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>

Thanks!


