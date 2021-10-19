Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF24331C8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:03:12 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcl1c-0008SN-4W
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mcl0I-0007lZ-2E
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:01:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mcl0E-0008Hj-9z
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:01:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J8pkcQ004509; 
 Tue, 19 Oct 2021 05:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C9wSrlocQGi0BWvHXYP8iW5tumbUty/bqmdJSCWOHWI=;
 b=q75QR6jzFCYIacPRFGNYa9nOwHXhaWZUgwfMfQzoDAb6LXfq36VW/RMduwYZ7tAB1Nel
 1l9slvv72IKPnGG/sh/A1qwz2oc8Z/WQSd70Agj3MvPHZASCpH4ZjQIqXJYz6nrPzyae
 /W8TEPZy3W3SLho/2syum50oD3wOgtz05kEB0K4OMeF++urIrkp663GVGVENMh/gucKj
 KoDGQaakgRxNyKFDuwh8Xqz61R1+fhQJG7OY5KSnEngntsbdUg4o+BWecfDOiMEvaOdM
 ZrgHKR48//uQPDFnRZeRZi6BvlWSOch+aA6GVLZpazdot8OSWAZW4iVRNgPz6GSZ1nUw Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bstvpg68w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 05:01:42 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19J8xdMt031762;
 Tue, 19 Oct 2021 05:01:41 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bstvpg683-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 05:01:41 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19J8w44J015299;
 Tue, 19 Oct 2021 09:01:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3bqpc9nur3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:01:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19J91avN46989618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 09:01:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CEA6A406D;
 Tue, 19 Oct 2021 09:01:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D2FA406A;
 Tue, 19 Oct 2021 09:01:35 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.54.36])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 09:01:35 +0000 (GMT)
Subject: Re: [PATCH] monitor: Fix find_device_state() for IDs containing
 slashes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211019085711.86377-1-armbru@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <69aa4452-15ec-c40f-a431-bb3b00a73bed@de.ibm.com>
Date: Tue, 19 Oct 2021 11:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019085711.86377-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: swKqtZtpHHN9J4fD948bnSM13bsOGuQC
X-Proofpoint-GUID: wox5A15lfXmjEYKE9ztp0u5zognCgcOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110190055
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, pbonzini@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.10.21 um 10:57 schrieb Markus Armbruster:
> Recent commit 6952026120 "monitor: Tidy up find_device_state()"
> assumed the function's argument is "the device's ID or QOM path" (as
> documented for device_del).  It's actually either an absolute QOM
> path, or a QOM path relative to /machine/peripheral/.  Such a relative
> path is a device ID when it doesn't contain a slash.  When it does,
> the function now always fails.  Broke iotest 200, which uses relative
> path "vda/virtio-backend".
> 
> It fails because object_resolve_path_component() resolves just one
> component, not a relative path.
> 
> The obvious function to resolve relative paths is
> object_resolve_path().  It picks a parent automatically.  Too much
> magic, we want to specify the parent.  Create new
> object_resolve_path_at() for that, and use it in find_device_state().
> 
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

thank you for your quick response, highly appreciated.

> ---
>   include/qom/object.h   | 12 ++++++++++++
>   qom/object.c           | 11 +++++++++++
>   softmmu/qdev-monitor.c |  8 +-------
>   3 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index faae0d841f..fae096f51c 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1543,6 +1543,18 @@ Object *object_resolve_path(const char *path, bool *ambiguous);
>   Object *object_resolve_path_type(const char *path, const char *typename,
>                                    bool *ambiguous);
>   
> +/**
> + * object_resolve_path_at:
> + * @parent: the object in which to resolve the path
> + * @path: the path to resolve
> + *
> + * This is like object_resolve_path(), except paths not starting with
> + * a slash are relative to @parent.
> + *
> + * Returns: The resolved object or NULL on path lookup failure.
> + */
> +Object *object_resolve_path_at(Object *parent, const char *path);
> +
>   /**
>    * object_resolve_path_component:
>    * @parent: the object in which to resolve the path
> diff --git a/qom/object.c b/qom/object.c
> index 6be710bc40..4f0677cca9 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2144,6 +2144,17 @@ Object *object_resolve_path(const char *path, bool *ambiguous)
>       return object_resolve_path_type(path, TYPE_OBJECT, ambiguous);
>   }
>   
> +Object *object_resolve_path_at(Object *parent, const char *path)
> +{
> +    g_auto(GStrv) parts = g_strsplit(path, "/", 0);
> +
> +    if (*path == '/') {
> +        return object_resolve_abs_path(object_get_root(), parts + 1,
> +                                       TYPE_OBJECT);
> +    }
> +    return object_resolve_abs_path(parent, parts, TYPE_OBJECT);
> +}
> +
>   typedef struct StringProperty
>   {
>       char *(*get)(Object *, Error **);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 89c473cb22..e8a1c7e52a 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -865,15 +865,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>   
>   static DeviceState *find_device_state(const char *id, Error **errp)
>   {
> -    Object *obj;
> +    Object *obj = object_resolve_path_at(qdev_get_peripheral(), id);
>       DeviceState *dev;
>   
> -    if (id[0] == '/') {
> -        obj = object_resolve_path(id, NULL);
> -    } else {
> -        obj = object_resolve_path_component(qdev_get_peripheral(), id);
> -    }
> -
>       if (!obj) {
>           error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                     "Device '%s' not found", id);
> 

