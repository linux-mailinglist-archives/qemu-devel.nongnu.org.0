Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79367F791
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 12:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLjQD-0002Xr-Iy; Sat, 28 Jan 2023 06:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjQ3-0002WF-Ac
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjQ1-00073E-7Z
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674905448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5smHCqKjUbP6qZuUMOjcY4q4Ka/eiA/R8XvA2XSmUo=;
 b=UEJHY/26ubJ1kVKysw2I+9WkWLceHFnKUnUTfIhfjQ2L1MIadx/6ABwPTZ5IZKIEHxDYIM
 Wepw0+H2FxcrRcF8Y59KE+EvV1etTv2AkjGExhlOqVWgxU7SFVQmrVTC9acmWqbVzOAggo
 k8o9yMCElZOzcrhPTzGDCwuurJufMdg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-X0jvWSVkPamstkVaIL8zSg-1; Sat, 28 Jan 2023 06:30:46 -0500
X-MC-Unique: X0jvWSVkPamstkVaIL8zSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso4267576wms.0
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 03:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5smHCqKjUbP6qZuUMOjcY4q4Ka/eiA/R8XvA2XSmUo=;
 b=ml5c9XwtTQY0+nTGa1emLOUEgHAAzchCzbXJOmFDP5csMy6gPo0hx0CcHpR5aJP0Dr
 EJoQJ1rSLJZd0ijSe5M/I2AGerYyGgGhKozrWMtxaBBEWmNjVq9H7c9B2ss09tEYBWSx
 0BQMi1Dzw7EmzD6iA1m7QwQZV2O6Kb2mWmADhWqjJdd//zZlViIKp6EPWRjdzoO1KeV3
 vlTxoFzM+5CeGkVB0f9vGVS33JU8xo+VAJe05Ei2NFUfUo6vh67ssVFCwbrP1nZdO4D4
 7kOBX2Y/Ui5T6nyw1svJKt8hSXHKiri/5n/TZgye5R0vdcv2sKq9Ohc8OetdXpohRGkt
 jtdQ==
X-Gm-Message-State: AFqh2kqYMEpoSz4Nwwc7/VWekyNi6h8SZRECPZMk/iakswcxnMcQUm33
 8Iw6QNRttUzL5zheGC+Z4MVdxH+wYevez2OIVCUtOynleQh2QGMEk5c+tOAk2fmxSLOOxJ6n3Qk
 yWgOmnwcoq3Fw8nA=
X-Received: by 2002:a1c:f310:0:b0:3db:15d9:1485 with SMTP id
 q16-20020a1cf310000000b003db15d91485mr36720686wmq.39.1674905445415; 
 Sat, 28 Jan 2023 03:30:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtm7rOdt/xvgDSyHTGoeY9PhiOZy7l3H2NkO9H8m/AOtqjI9p8uAoG0tcmECWWcsOKFJzuoAA==
X-Received: by 2002:a1c:f310:0:b0:3db:15d9:1485 with SMTP id
 q16-20020a1cf310000000b003db15d91485mr36720671wmq.39.1674905445173; 
 Sat, 28 Jan 2023 03:30:45 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c254500b003dc47fb33dasm1708246wma.18.2023.01.28.03.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 03:30:44 -0800 (PST)
Date: Sat, 28 Jan 2023 06:30:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 05/12] cryptodev: Introduce 'query-cryptodev' QMP
 command
Message-ID: <20230128062647-mutt-send-email-mst@kernel.org>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
 <20230128035633.2548315-6-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128035633.2548315-6-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sat, Jan 28, 2023 at 11:56:26AM +0800, zhenwei pi wrote:
> Now we have a QMP command to query crypto devices:
> virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
> {
>   "return": [
>     {
>       "service": [
>         "akcipher",
>         "mac",
>         "hash",
>         "cipher"
>       ],
>       "id": "cryptodev1",
>       "client": [
>         {
>           "queue": 0,
>           "type": "builtin"
>         }
>       ]
>     },
>     {
>       "service": [
>         "akcipher"
>       ],
>       "id": "cryptodev0",
>       "client": [
>         {
>           "queue": 0,
>           "type": "lkcf"
>         }
>       ]
>     }
>   ],
>   "id": "libvirt-417"
> }
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/cryptodev.json  | 44 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index c2a053db0e..d51eeb5ee4 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/cryptodev.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-cryptodev.h"
>  #include "qapi/visitor.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> @@ -33,6 +34,50 @@
>  
>  static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
>  
> +static int qmp_query_cryptodev_foreach(Object *obj, void *data)
> +{
> +    CryptoDevBackend *backend;
> +    CryptodevInfoList **infolist = data;
> +    uint32_t services, i;
> +
> +    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
> +        return 0;
> +    }
> +
> +    CryptodevInfo *info = g_new0(CryptodevInfo, 1);
> +    info->id = g_strdup(object_get_canonical_path_component(obj));
> +
> +    backend = CRYPTODEV_BACKEND(obj);
> +    services = backend->conf.crypto_services;
> +    for (i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
> +        if (services & (1 << i)) {
> +            QAPI_LIST_PREPEND(info->service, i);
> +        }
> +    }
> +
> +    for (i = 0; i < backend->conf.peers.queues; i++) {
> +        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
> +        CryptodevBackendClient *client = g_new0(CryptodevBackendClient, 1);
> +
> +        client->queue = cc->queue_index;
> +        client->type = cc->type;
> +        QAPI_LIST_PREPEND(info->client, client);
> +    }
> +
> +    QAPI_LIST_PREPEND(*infolist, info);
> +
> +    return 0;
> +}
> +
> +CryptodevInfoList *qmp_query_cryptodev(Error **errp)
> +{
> +    CryptodevInfoList *list = NULL;
> +    Object *objs = container_get(object_get_root(), "/objects");
> +
> +    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
> +
> +    return list;
> +}
>  
>  CryptoDevBackendClient *cryptodev_backend_new_client(void)
>  {
> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
> index 8732a30524..940078ace0 100644
> --- a/qapi/cryptodev.json
> +++ b/qapi/cryptodev.json
> @@ -43,3 +43,47 @@
>  { 'enum': 'QCryptodevBackendType',
>    'prefix': 'QCRYPTODEV_BACKEND_TYPE',
>    'data': ['builtin', 'vhost-user', 'lkcf']}
> +
> +##
> +# @CryptodevBackendClient:
> +#
> +# Information about a queue of crypto device.
> +#
> +# @queue: the queue index of the crypto device
> +#
> +# @type: the type of the crypto device
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'CryptodevBackendClient',
> +  'data': { 'queue': 'uint32',
> +            'type': 'QCryptodevBackendType' } }
> +
> +##
> +# @CryptodevInfo:
> +#
> +# Information about a crypto device.
> +#
> +# @id: the id of the crypto device
> +#
> +# @service: supported service types of a crypto device
> +#
> +# @client: the additional infomation of the crypto device
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'CryptodevInfo',
> +  'data': { 'id': 'str',
> +            'service': ['QCryptodevBackendServiceType'],
> +            'client': ['CryptodevBackendClient'] } }

So we end up with both CryptodevBackendClient and
CryptoDevBackendClient. Please don't do this.


> +
> +##
> +# @query-cryptodev:
> +#
> +# Returns information about current crypto devices.
> +#
> +# Returns: a list of @CryptodevInfo
> +#
> +# Since: 8.0
> +##
> +{ 'command': 'query-cryptodev', 'returns': ['CryptodevInfo']}
> -- 
> 2.34.1


