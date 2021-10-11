Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD44286F1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 08:41:58 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZp0T-00034E-EH
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 02:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mZoyP-0002J7-DY
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 02:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mZoyM-0004iC-KZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 02:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633934381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+e3nwif1FXKhzTzmnk2e5c6heZMuGkEHBEy9kXmvQY=;
 b=YCTUiVKstZme9Zn3TjliTh9bpKE9fbYT/F46ryfDZe5b7IPkq+DHdHlP3Ll5XVBlKBJHGG
 ZWhgdr3R65h22L7rMfci4qDiZpr76VNMuz82ijz2QhI23iDJPLdI5tTDHTNgwFFPYE2koO
 xb7SSiftUvaumFMMTMcSmW0tAUMldZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-sxLh0zBnOKeGqSiSrMzhww-1; Mon, 11 Oct 2021 02:39:40 -0400
X-MC-Unique: sxLh0zBnOKeGqSiSrMzhww-1
Received: by mail-wr1-f70.google.com with SMTP id
 p12-20020adfc38c000000b00160d6a7e293so9934342wrf.18
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 23:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d+e3nwif1FXKhzTzmnk2e5c6heZMuGkEHBEy9kXmvQY=;
 b=cT830vMZgpPE/sDU/FIrBXtGMfYdYYuh0LO6uaNKV5B3BK1y9G3Qn9HcnbcPAAqkys
 4RCR6PxVPeu4S6PgCjlhpB8oGODJUiqoKbB6bifUCuimLV2X4dDsS4xGEhGcpsWG+j5I
 ytNGcEZ8OkXTEBXJSGcoshAGYHYZ1qPI6T6qev/cxEQ9i0WsQOFx60DWK+htbYrEQ6GG
 vNbwpK7+LZp02OWs7Sv9TGZOLiQnggSM9/fG641ybNvoMIe2vJ902bjkQ8m1WJv1HLJS
 cvEQIpOR+f6zc8oD20NRUN66AT7UXJTrg1mhaukCHGja4pAb4LgeSrdMzxI4W7kPKRTU
 LoRA==
X-Gm-Message-State: AOAM530usAe257oV7mSvXU+iJPTZt9EAvmEV3yTuv7U4QHlY965iLwJX
 nPttwHe1XoKlp/y8O8i8IyNVFVrrrDXIM0/xF8Vn5aoXtoUv0en6pEuChpiDUhqzAqV+2ufCyY7
 D6uBqLgFjXnQFfpw=
X-Received: by 2002:a05:6000:184b:: with SMTP id
 c11mr13240553wri.29.1633934379219; 
 Sun, 10 Oct 2021 23:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsxdySqx9BGlU0stP4KjHB6PmDhSlld29NS4wn3uKBw27/uRkQwhydYTJ36echP4Be1nMQcQ==
X-Received: by 2002:a05:6000:184b:: with SMTP id
 c11mr13240535wri.29.1633934378999; 
 Sun, 10 Oct 2021 23:39:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id f184sm6716243wmf.22.2021.10.10.23.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 23:39:38 -0700 (PDT)
Message-ID: <cc3e1c8e-2472-1ba8-3a27-c220877b0756@redhat.com>
Date: Mon, 11 Oct 2021 08:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] monitor: Tidy up find_device_state()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210916111707.84999-1-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210916111707.84999-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: imammedo@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/21 13:17, Markus Armbruster wrote:
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
> ---
>   softmmu/qdev-monitor.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Queued, thanks.

Paolo

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


