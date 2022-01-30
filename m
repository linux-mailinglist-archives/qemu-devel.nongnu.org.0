Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236354A34ED
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 08:36:28 +0100 (CET)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE4l8-0000qc-Kg
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 02:36:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE44F-00054E-7q
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:52:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE44C-0002HW-SV
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643525524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppbgrqXXRvr7WyHpfHnKCXNAPOBM3v0wXQdYjLGRVqs=;
 b=V2FE3GsLarFXJFeptckU9AXR8A36TPydVaSqynJEU21muWS0tkx4DKqeJqrSne4AqrHTCt
 gSxphMO2YrMi0oAXQW/lOnbrY2fN37lbeZYKC8SPuTAesHJ5UPOiZHivrGYSr9lLf+Kr+v
 0qf8m6PyDDaIMkW6654mcgSbz6Pke2A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-LN3pa7eSO3OdzT5PBIxRPg-1; Sun, 30 Jan 2022 01:52:02 -0500
X-MC-Unique: LN3pa7eSO3OdzT5PBIxRPg-1
Received: by mail-pj1-f71.google.com with SMTP id
 x1-20020a17090ab00100b001b380b8ed35so6709402pjq.7
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 22:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ppbgrqXXRvr7WyHpfHnKCXNAPOBM3v0wXQdYjLGRVqs=;
 b=aWtOeFEE6T/c3lZCpgD4X769y9vd3vLdpmBmhOAAkbU/EsgTxx+x+4T2pOs5n4MC8T
 F0A2aTsyxStq7Kpcic7dTXaFvQbpLwxYo1+sqKRcBw3VwRWw35iwOZ1c0UoY6qTpJnzs
 OmWCB0q4pgbj9hV10+Jjo/nH4ik+okComqXtm/11uplusOX1j17NBmdpGXIyH0ibTtBl
 juSCExyRoftdidQT5y4lppEnUigjKOvIDjIHhY0rF9v8b38qMdd5WvSQyzMwdgjtl3bv
 cH9gA0KRImMDBjSE2XkawQpLdHWNUPgcC+ETJtrQpTk1087dNUx8n4p3wStXOW2AYgc8
 CQFg==
X-Gm-Message-State: AOAM530S39k5Y5kSjv6YopBeobXbQdXYQP4tYtytq32UcWpi0Rhp7rkP
 AXfEiYNduSjNr8QM+5uFZUtRJHulFnUAYSFrCq4W1HtB8UGxT3yNXKKJTlUrnXcbaUcNqTXdMvp
 ggYXo2YAj/EapNEc=
X-Received: by 2002:a17:902:c702:: with SMTP id
 p2mr15500567plp.140.1643525521108; 
 Sat, 29 Jan 2022 22:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJqc8TQvZT00Y1zuKxJk5dWauNsccg1caSt4rH8kMQ1e2YmRsCOhVzmvBHplUeHja2YOW6JA==
X-Received: by 2002:a17:902:c702:: with SMTP id
 p2mr15500559plp.140.1643525520910; 
 Sat, 29 Jan 2022 22:52:00 -0800 (PST)
Received: from [10.72.12.243] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id rj1sm7435920pjb.49.2022.01.29.22.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 22:52:00 -0800 (PST)
Message-ID: <2391fb35-15df-abd4-192e-7b124c289c6e@redhat.com>
Date: Sun, 30 Jan 2022 14:51:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 29/31] vdpa: Make ncs autofree
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-30-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-30-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> Simplifying memory management.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


To reduce the size of this series. This can be sent as an separate patch 
if I was not wrong.

Thanks


> ---
>   net/vhost-vdpa.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4125d13118..4befba5cc7 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   {
>       const NetdevVhostVDPAOptions *opts;
>       int vdpa_device_fd;
> -    NetClientState **ncs, *nc;
> +    g_autofree NetClientState **ncs = NULL;
> +    NetClientState *nc;
>       int queue_pairs, i, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> @@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>               goto err;
>       }
>   
> -    g_free(ncs);
>       return 0;
>   
>   err:
> @@ -310,7 +310,6 @@ err:
>           qemu_del_net_client(ncs[0]);
>       }
>       qemu_close(vdpa_device_fd);
> -    g_free(ncs);
>   
>       return -1;
>   }


