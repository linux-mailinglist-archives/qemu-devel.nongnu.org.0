Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F22AD87F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:18:53 +0100 (CET)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUTz-0001HT-7q
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mimu@linux.ibm.com>)
 id 1kcUSF-0000NG-0R; Tue, 10 Nov 2020 09:17:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48184
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mimu@linux.ibm.com>)
 id 1kcUSC-0000eU-UC; Tue, 10 Nov 2020 09:17:02 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAE2UpT056834; Tue, 10 Nov 2020 09:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=3U3TD7TSfrqE1Ob05MtWXmXj8eCVM3r/RVx09pM6Jmo=;
 b=DugmFrklYIztmvwGMtM16a03sHp0wEHjQSFq+BG7Xpyq815kv/sGZqy6W/Wv0fDGySyo
 n1RUOdrfH7GIvWASYgfz8YpvGvOxT8z/rOJWTeaatdTT7TgejzDTXRaWCpxQqhgk1wu/
 iZX9uyUoIuVLsHogXI/NM5gyIhicbNGLLZjS/Az5eVa3LJpOF9GCh39nQuJDTFmmfzY+
 Z1l4+iWnHuaOCuSzBERcGqHWJVVuwR6Lwqu/ddC+gAbkUIDXHXpb267titKQnC7iRGIH
 yfZc7/2zplKpAnjLDWH0yJOCsgnqwc4qbBL3l5nAtD1xuTiejZgjazHw8T4TeciI5M5V uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34qv4v8xur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 09:16:55 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AAE2jCD059039;
 Tue, 10 Nov 2020 09:16:54 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34qv4v8xtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 09:16:54 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AAE8ZhP029006;
 Tue, 10 Nov 2020 14:16:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34nk78k7xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 14:16:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AAEGnuf53805442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 14:16:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8F55AE04D;
 Tue, 10 Nov 2020 14:16:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B5BAE045;
 Tue, 10 Nov 2020 14:16:49 +0000 (GMT)
Received: from [9.145.70.110] (unknown [9.145.70.110])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Nov 2020 14:16:49 +0000 (GMT)
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Message-ID: <4a3d24e0-399f-f509-9a5c-c66c57b2d28a@linux.ibm.com>
Date: Tue, 10 Nov 2020 15:16:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201109195303.459f6fba.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=mimu@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 09:16:55
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
Reply-To: mimu@linux.ibm.com
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09.11.20 19:53, Halil Pasic wrote:
> On Mon, 9 Nov 2020 17:06:16 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
>>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
>>>   {
>>>       VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
>>>       DeviceState *vdev = DEVICE(&dev->vdev);
>>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
>>> +
>>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
>>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
>>> +    }
>>
>> I would like to have a comment explaining the numbers here, however.
>>
>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
>> possible, apply some other capping). 4 seems to be a bit arbitrary
>> without explanation, although I'm sure you did some measurements :)
> 
> Frankly, I don't have any measurements yet. For the secure case,
> I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
> the cc list. @Mimu can you help us out.
> 
> Regarding the normal non-protected VMs I'm in a middle of producing some
> measurement data. This was admittedly a bit rushed because of where we
> are in the cycle. Sorry to disappoint you.

I'm talking with the perf team tomorrow. They have done some 
measurements with multiqueue for PV guests and I asked for a comparison 
to non PV guests as well.

Michael

> 
> The number 4 was suggested by Christian, maybe Christian does have some
> readily available measurement data for the normal VM case. @Christian:
> can you help me out?
> 
> Regards,
> Halil
> 

-- 
Mit freundlichen Grüßen / Kind regards
Michael Müller

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

