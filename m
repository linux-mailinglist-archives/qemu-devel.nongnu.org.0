Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494604691A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:41:28 +0100 (CET)
Received: from localhost ([::1]:51510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9Yt-0001l6-5Y
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9XI-00011s-RM
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9XG-0006zQ-Oq
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638779984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tdwf6d+p4Ft9FfK8Htm09frKW+6p08y4oR49UsGQOGU=;
 b=ikLO7LyrIUX6I+wzsIc/ofadPpIypd0uhByz/fk1dm4nVUTwoAqewFDM2i9N2MxD3jlhWR
 w5hHJPjDgUBZVwt2LdfFJ/lsmjpbOvw5hLi6QJ5PpiPDH9f5wURHuAskdL4hXuAGvWHXBc
 e9PSA/u8caIc3Xlc0q9oYEMLRpozDdo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-MVtozVPQMmKbpHzr_T1Aog-1; Mon, 06 Dec 2021 03:39:40 -0500
X-MC-Unique: MVtozVPQMmKbpHzr_T1Aog-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so1791118wrd.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tdwf6d+p4Ft9FfK8Htm09frKW+6p08y4oR49UsGQOGU=;
 b=NPV+7favszCIfTBQjlT+aBlzC9sPI8Y9du5QTE2khgAavLb8OF21X6KuCwOvqqfZ0r
 YYnHEpe80gpyZh4mfjnB0UeAlSP+VIZRHG1yklflauC0zGIuAa5IRZw3q/uODz0kfLkg
 GLLwk2Iq6OZ9hoJ7Fhdmr/3ib0KoMvqhBbpP1rjOUqPxt3r+9gpeiHiHRqifIQOczbx1
 f4ZV6juK9LmYIARI2l2GlqbHUJYRlso0I4lmzzA5IpCbp+VhD0ZxxTCFQLIxUmaE9iZI
 +K2CiGRNN6owQHfDpsNAnNivQr4bCa3IDwD3VKihZnzS+wHeKATQjM8GQnuZeQXLzZDK
 HSaQ==
X-Gm-Message-State: AOAM532rXEhRa621PbykWhuR6PJcuR8Zml/DBfD7TxJXyqaLrAEbYrN2
 Ogq5WBmKBzsIR7I59kkVRVfU8dVeoVCzYGbGptkGojgYD5vJu6bMiCnTX3YImOMZL8rI0lyqgSi
 62/uWTH/qzOKF/Wk=
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr12472656wmq.122.1638779979597; 
 Mon, 06 Dec 2021 00:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5qJzFhvOfz26tkwjTZkyrdjBsMCDp6FaRS+hQDvhFcaZ8EjKwoQcIwcxBcp0Eg2PwHhoByA==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr12472641wmq.122.1638779979441; 
 Mon, 06 Dec 2021 00:39:39 -0800 (PST)
Received: from xz-m1.local ([85.203.46.183])
 by smtp.gmail.com with ESMTPSA id p27sm10028443wmi.28.2021.12.06.00.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 00:39:38 -0800 (PST)
Date: Mon, 6 Dec 2021 16:39:32 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <Ya3MROP77Uibicmn@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 09:39:47AM +0800, huangy81@chinatelecom.cn wrote:
> +void dirtylimit_setup(int max_cpus)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        return;
> +    }
> +
> +    dirtylimit_calc_state_init(max_cpus);
> +    dirtylimit_state_init(max_cpus);
> +}

[...]

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1..0f83ce3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_init_displays();
>      accel_setup_post(current_machine);
>      os_setup_post();
> +    dirtylimit_setup(current_machine->smp.max_cpus);
>      resume_mux_open();

Can we do the init only when someone enables it?  We could also do proper
free() for the structs when it's globally turned off.

-- 
Peter Xu


