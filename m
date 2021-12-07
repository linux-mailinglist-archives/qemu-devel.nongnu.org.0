Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CF46B60B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:33:36 +0100 (CET)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVup-0001D8-CY
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muVsx-0000Pk-HX
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:31:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muVsv-0005CB-Iu
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638865896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRYzNG7KJwEVzIStiXYy/hGzsK+4gOeOj/J4iR3oTY0=;
 b=S37J8UXow4CV/loAsu3BJb8hIaXv3qqVGXBhcVLnHPMUp2keM7uTYsgoZdAdlG08+TCd+z
 5tEiL7M1t+vEjoDkoI8YoMLgaRqvZH+P6dXpe5B/gyhnKRwgeQ9jTcNBopSMm4M4Ltv7hW
 rnL9duqOQ0e2gr6yCpByhGicsfL2IHM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-l4MnFxAKMIy0qISkVXsQVg-1; Tue, 07 Dec 2021 03:31:35 -0500
X-MC-Unique: l4MnFxAKMIy0qISkVXsQVg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso2657535wrq.16
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=tRYzNG7KJwEVzIStiXYy/hGzsK+4gOeOj/J4iR3oTY0=;
 b=oVriDZKq8oOjOUZnlPfAnhxwI3ZtCCixsSZxlz5i0j64ZfpTotyD96yofzrj4FC08R
 rYbTuRYQbBAQRBITAT7G/WIAIVSSszNAsEzxc8kp386yYoXCngU3jN/NzlHvfgDLcZrF
 cu5pUgUvtn9GO3GflpWOPmJ+EBTrfUm0Es6EXdpcCkRkAp6JqkDWRAmkScxxDKEgvvic
 QyWytJU8lRNNiXCIMHCZ2YfijuDTLKhvaNkwX1pEtJllPEUH1MLWXIk1+jQGYR4gzVde
 yS6ZGdE6brJgpdZPk+RG9y3LpGkCVHQF43LQ5ZnT9aMZ5Ozf/lqVhr4h6i3k/GaKUEtl
 2C7w==
X-Gm-Message-State: AOAM533KLvn8f6Cmvj19U9ogQViwFAMF5x+hKT46YkTHRL/SNkrmVH8/
 95Hy4FUJxD9OUnmWe5sX90VhJscQK6YUGzdpwpZ6KbOIS8zFkaxutZ/+MRTPZU/MVu8mpGhdgaf
 ftl26Hxd+KZ6zVjE=
X-Received: by 2002:a5d:6707:: with SMTP id o7mr51024486wru.172.1638865894695; 
 Tue, 07 Dec 2021 00:31:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/oHpXGfD0gA6X1A34mRszDZXENH4rvGLkQyskcDKCvfIFl9DI+vILpYDCl6R9WBhnmAOD1A==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr51024459wru.172.1638865894424; 
 Tue, 07 Dec 2021 00:31:34 -0800 (PST)
Received: from [192.168.3.132] (p4ff23e57.dip0.t-ipconnect.de. [79.242.62.87])
 by smtp.gmail.com with ESMTPSA id
 w2sm13571294wrn.67.2021.12.07.00.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:31:34 -0800 (PST)
Message-ID: <5a5ab29a-302e-2eaf-23d8-0de731842c41@redhat.com>
Date: Tue, 7 Dec 2021 09:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/2] hostmem: use a static size for maxnode, validate
 policy everywhere
In-Reply-To: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, pbonzini@redhat.com, yc-core@yandex-team.ru,
 sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.12.21 08:06, Daniil Tatianin wrote:
> Previously we would calculate the last set bit in the mask, and add
> 2 to that value to get the maxnode value. This is unnecessary since
> the mbind syscall allows the bitmap to be any (reasonable) size as
> long as all the unused bits are clear. This also adds policy validation
> in multiple places so that it's guaranteed to be valid when we call
> mbind.
> 
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  backends/hostmem.c | 64 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4c05862ed5..392026efe6 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -38,6 +38,29 @@ host_memory_backend_get_name(HostMemoryBackend *backend)
>      return object_get_canonical_path(OBJECT(backend));
>  }
>  
> +static bool
> +validate_policy(HostMemPolicy policy, bool nodes_empty, Error **errp)
> +{
> +    /*
> +     * check for invalid host-nodes and policies and give more verbose
> +     * error messages than mbind().
> +     */
> +    if (!nodes_empty && policy == MPOL_DEFAULT) {
> +        error_setg(errp, "host-nodes must be empty for policy default,"
> +                   " or you should explicitly specify a policy other"
> +                   " than default");
> +        return false;
> +    }
> +
> +    if (nodes_empty && policy != MPOL_DEFAULT) {
> +        error_setg(errp, "host-nodes must be set for policy %s",
> +                   HostMemPolicy_str(policy));
> +        return false;
> +    }
> +
> +    return true;
> +}

Hm, we set two properties individually but bail out when the current combination 
is impossible, which is nasty. It means we have modify properties in the right order
(which will differ based on the policy) to make a change.

Do we have any sane use case of modifying the policy/host-nodes at runtime?
I mean, it's just completely wrong when we already have any memory
preallocated/touched inside the range, as we won't issue another mbind call.

I suggest instead to fix this hole:

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4c05862ed5..7edc3a075e 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -111,6 +111,11 @@ host_memory_backend_set_host_nodes(Object *obj, Visitor *v, const char *name,
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
     uint16List *l, *host_nodes = NULL;
 
+    if (host_memory_backend_mr_inited(backend)) {
+        error_setg(errp, "Property 'host-nodes' cannot be changed anymore.");
+        return;
+    }
+
     visit_type_uint16List(v, name, &host_nodes, errp);
 
     for (l = host_nodes; l; l = l->next) {
@@ -142,6 +147,12 @@ static void
 host_memory_backend_set_policy(Object *obj, int policy, Error **errp)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+
+    if (host_memory_backend_mr_inited(backend)) {
+        error_setg(errp, "Property 'policy' cannot be changed anymore.");
+        return;
+    }
+
     backend->policy = policy;
 
 #ifndef CONFIG_NUMA


-- 
Thanks,

David / dhildenb


