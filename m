Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862242EF66
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:11:05 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbL7A-0007nq-C0
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mbL5J-0006bl-7j; Fri, 15 Oct 2021 07:09:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mbL5G-0002Tk-Qq; Fri, 15 Oct 2021 07:09:08 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FAQws0023851; 
 Fri, 15 Oct 2021 07:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7LWI65XCvrJoHZYZImuXtTTT5N3NaC4hQ9+xI6Ttj9c=;
 b=WiteaniHXSTseC8wi5ZUavdAtEwZDjQo433EfdneuF1N88dCOU6amNj50mF1JmxetXFK
 wF34KAjm1mzPcrOphOfa2hFzN0SdbmuAJ9mM7g4Bi3j5UiUKbnJMWaHeX47ZXopzji+2
 btG4R6eSI+QdGyMras8j2iBrScJuwHR5yXvR9y9WFRVH2JCrJbqTvCHt5/u/scD7OBT6
 lQTdxsTE88VAmMTjoGmG7WgpXTZca7IkczaA5qv6e20wUalHRQIxGuzMUJEzoraTCmHQ
 U6XzGJIva/jdsniVgJQZvShSNvfrelqxU6mx+KrGyjAwixe7ukFHrjwCh+ZraDN3ZzkT EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpm7c350t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 07:08:56 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19FAt6vJ012590;
 Fri, 15 Oct 2021 07:08:56 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpm7c34yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 07:08:56 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19FB5wnB004313;
 Fri, 15 Oct 2021 11:08:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3bk2qaah11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 11:08:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19FB3Blp52887888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 11:03:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 201BA11C07A;
 Fri, 15 Oct 2021 11:08:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0A1611C08C;
 Fri, 15 Oct 2021 11:08:50 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.15.94]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Oct 2021 11:08:50 +0000 (GMT)
Subject: Re: [PULL 37/40] monitor: Tidy up find_device_state()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu block <qemu-block@nongnu.org>
References: <20211013090728.309365-1-pbonzini@redhat.com>
 <20211013090728.309365-38-pbonzini@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
Date: Fri, 15 Oct 2021 13:08:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013090728.309365-38-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eIOZlBS86oJ01feda3XICkJqWL8cg6Kl
X-Proofpoint-ORIG-GUID: BVK75jD8t2e11W9SEfKDfj1RWOeJGzQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_03,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150069
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 13.10.21 um 11:07 schrieb Paolo Bonzini:
> From: Markus Armbruster <armbru@redhat.com>
> 
> Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
> extended find_device_state() to accept QOM paths in addition to qdev
> IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
> duplicates the check done for the qdev ID case earlier, except it sets
> a *different* error: GenericError "ID is not a hotpluggable device"
> when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
> when passed a qdev ID.  Fortunately, the latter won't happen as long
> as we add only devices to /machine/peripheral/.
> 
> Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
> unplugged device in 'peripheral' container" rewrote the lookup by qdev
> ID to use QOM instead of qdev_find_recursive(), so it can handle
> buss-less devices.  It does so by constructing an absolute QOM path.
> Works, but object_resolve_path_component() is easier.  Switching to it
> also gets rid of the unclean duplication described above.
> 
> While there, avoid converting to TYPE_DEVICE twice, first to check
> whether it's possible, and then for real.

This one broke qemu iotest 280 on s390:


280   fail       [13:06:19] [13:06:19]   0.3s   (last: 0.3s)  output mismatch (see 280.out.bad)
--- /home/cborntra/REPOS/qemu/tests/qemu-iotests/280.out
+++ 280.out.bad
@@ -37,14 +37,14 @@
  === Resume the VM and simulate a write request ===
  {"execute": "cont", "arguments": {}}
  {"return": {}}
-{"return": ""}
+{"return": "Error: Device 'vda/virtio-backend' not found\r\n"}

  === Commit it to the backing file ===
  {"execute": "block-commit", "arguments": {"auto-dismiss": false, "device": "top-fmt", "job-id": "job0", "top-node": "top-fmt"}}
  {"return": {}}
  {"execute": "job-complete", "arguments": {"id": "job0"}}
  {"return": {}}
-{"data": {"device": "job0", "len": 65536, "offset": 65536, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_READY", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"data": {"device": "job0", "len": 65536, "offset": 65536, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_READY", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
  {"return": {}}
Failures: 280
Failed 1 of 1 iotests


> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20210916111707.84999-1-armbru@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/qdev-monitor.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 0705f00846..3df99ce9fc 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -836,16 +836,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>   static DeviceState *find_device_state(const char *id, Error **errp)
>   {
>       Object *obj;
> +    DeviceState *dev;
>   
>       if (id[0] == '/') {
>           obj = object_resolve_path(id, NULL);
>       } else {
> -        char *root_path = object_get_canonical_path(qdev_get_peripheral());
> -        char *path = g_strdup_printf("%s/%s", root_path, id);
> -
> -        g_free(root_path);
> -        obj = object_resolve_path_type(path, TYPE_DEVICE, NULL);
> -        g_free(path);
> +        obj = object_resolve_path_component(qdev_get_peripheral(), id);
>       }
>   
>       if (!obj) {
> @@ -854,12 +850,13 @@ static DeviceState *find_device_state(const char *id, Error **errp)
>           return NULL;
>       }
>   
> -    if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
> +    dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
> +    if (!dev) {
>           error_setg(errp, "%s is not a hotpluggable device", id);
>           return NULL;
>       }
>   
> -    return DEVICE(obj);
> +    return dev;
>   }
>   
>   void qdev_unplug(DeviceState *dev, Error **errp)
> 

