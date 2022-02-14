Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F44B4422
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:31:56 +0100 (CET)
Received: from localhost ([::1]:33470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWm3-0000f4-2R
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWgO-0006vl-RH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWgN-0002gs-Dr
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644827162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GRn1oyDGFx6bNvOgv+ye5sNAly2OuEfqYA/+Cl1ogc4=;
 b=gdfSJjo/yJDDY8qz1zxbNDrpjKdRTu5ZK0XErwzyHzXpbuWOku7hNgTkBW5UUrOjIFw1ZV
 4ruS9AI0qjzWDn4jL2H6IMaaRimR3ONS1styLAZ2f2kvfDoX172KDDwpP7b3r2rF32k9UP
 ep/pvbExi0/34bffT/RaSezTHfbR064=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-hyeXoVkBNjCGj4kUdqwNMA-1; Mon, 14 Feb 2022 03:26:01 -0500
X-MC-Unique: hyeXoVkBNjCGj4kUdqwNMA-1
Received: by mail-pj1-f70.google.com with SMTP id
 j23-20020a17090a7e9700b001b8626c9170so13689231pjl.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 00:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GRn1oyDGFx6bNvOgv+ye5sNAly2OuEfqYA/+Cl1ogc4=;
 b=k1YEWwK+KEFXBHRrtpmg0WfrhVJXMcLtdu+Mkm5StyxOLbCqo4W5JWGiQ0la3QHUl0
 w0YqKUpgOO7a/8/sW3Z5IFUl3hXqbuSGtZ900J3IaHTUtSlDD0YjiUIqGty4643IJ6w6
 JRSQdlVjNOhlthg3s62SKyL5ALJAZ+ju1q3UESa38y2PmcMcUI2ZCNp7z21se5DU9m+b
 sxOiK7oLBN2BdJcA/G5lCgEBRjomZ6veM4afxoJyBq9sQhw8hHmlqcu7WoP++p7hwE3J
 sFIRtrHLHfPc8slgEE6tyZEDV2FuG7pC3ivfd0r/9eclLpwpJAzdGpED8r/AFMzQuMuG
 d0FA==
X-Gm-Message-State: AOAM533S3EKNwW5LwNeCFlDS15oso1/KMlbSSf1L1EbmRq7A/DlVsihd
 mHVxhMnyZsDrZeZZ+t1yIyQhEYVvpZ7gOyObcdqSeSkq38RzH1QIqdD1ZXCliraARqE1j72q8+W
 W3yUxLGDkdRxkQG4=
X-Received: by 2002:a63:156:: with SMTP id 83mr10833382pgb.36.1644827160070;
 Mon, 14 Feb 2022 00:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8c0EhE4UwMIu5yu03oexfGSBk5mhcdQ1F+W9JD1OUfgVRnP0BSGlCjWuo3yXvHcC1K3eUXg==
X-Received: by 2002:a63:156:: with SMTP id 83mr10833364pgb.36.1644827159818;
 Mon, 14 Feb 2022 00:25:59 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id b16sm4608156pfv.192.2022.02.14.00.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:25:59 -0800 (PST)
Date: Mon, 14 Feb 2022 16:25:52 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 7/7] softmmu/dirtylimit: Implement dirty page rate
 limit
Message-ID: <YgoSEDGhvGlMMRBE@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <32a65f0fbb691aa66094fc9162bff4daa6d7771d.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <32a65f0fbb691aa66094fc9162bff4daa6d7771d.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 12:17:41AM +0800, huangy81@chinatelecom.cn wrote:
> +static struct DirtyLimitInfoList *dirtylimit_query_all(void)
> +{
> +    int i, index;
> +    DirtyLimitInfo *info = NULL;
> +    DirtyLimitInfoList *head = NULL, **tail = &head;
> +
> +    dirtylimit_state_lock();
> +
> +    if (!dirtylimit_in_service()) {

Need to unlock?

> +        return NULL;
> +    }
> +
> +    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
> +        index = dirtylimit_state->states[i].cpu_index;
> +        if (dirtylimit_vcpu_get_state(index)->enabled) {
> +            info = dirtylimit_query_vcpu(index);
> +            QAPI_LIST_APPEND(tail, info);
> +        }
> +    }
> +
> +    dirtylimit_state_unlock();
> +
> +    return head;
> +}

-- 
Peter Xu


