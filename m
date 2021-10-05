Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EF4227CC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:29:02 +0200 (CEST)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkVB-00030E-0r
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXkM1-0004Pd-Gc
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:19:35 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:46814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXkLz-0000EE-5U
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:19:33 -0400
Received: from [192.168.15.208] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DC5442078B;
 Tue,  5 Oct 2021 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633439966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuYlH/STFdFZOrBBJhd/d4jC9TE9rzeZQ/kprnTe7pc=;
 b=xDzll0CkqSatenBtHudps4F+KW/Cr0f3DTHhLDBZm4PGXC107V/omqdwjeAzyYWHyGfQFJ
 Iam0PheBqTiYcPM4slLL75X2fSJymDnt1rty+sU5wOJiasiuXBUyD33tHiS2BtkyfCyIBm
 wRzeoCbNt366HciZCZGjm0rOs4DpYyQ=
Message-ID: <2c1805b2-cf6c-9928-91ea-fbadb7b9afed@greensocs.com>
Date: Tue, 5 Oct 2021 15:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] monitor: Tidy up find_device_state()
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210916111707.84999-1-armbru@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210916111707.84999-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/16/21 13:17, Markus Armbruster wrote:
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
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   softmmu/qdev-monitor.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index a304754ab9..d1ab3c25fb 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -831,16 +831,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
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
> @@ -849,12 +845,13 @@ static DeviceState *find_device_state(const char *id, Error **errp)
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

