Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EC4B82F5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:31:22 +0100 (CET)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFic-0000R1-3B
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:31:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKExh-0004Bq-Nb
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:42:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKExe-0004kw-QU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644997368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrsHPvJKQj6LOjMxGUEgHDkfXQP6KEdQ80skSnKEsO4=;
 b=e5EUlxFGVi8fkKdcZgs1PjRNQMXT3QoWW8foduoNRLGonrs3MRKwGBOSON0Ibf9745p2i7
 /coyWRQR2boiWUTuzPH1yhjPux2j9mI3++mRaXUTfdrzRaP196jyhq3jCXmNpkIxyDmL21
 MO0YdoV8IZHIA/mIYmG4hzO0L9J4Mys=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-2ni9kqKuO5u0pLfABLkh3A-1; Wed, 16 Feb 2022 02:42:47 -0500
X-MC-Unique: 2ni9kqKuO5u0pLfABLkh3A-1
Received: by mail-pl1-f197.google.com with SMTP id
 q23-20020a170902edd700b0014ed722ba9cso770986plk.18
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 23:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PrsHPvJKQj6LOjMxGUEgHDkfXQP6KEdQ80skSnKEsO4=;
 b=EWgMghQ4NzHZFucFCq+79DbUXJQjWg/t6wXiz2sddUHGPLoo7vIILAMJk4BrFYwIkn
 ZR51EfDF5BcSg2CzXh0G5dUcbBJo/0eWFNky8g33aX6zWUEZYoirKoBWASxShcsVvIqA
 Umg3yZPxDrS5q+1Hi3LXuMCpqYsOYxrZa1RkenSHAQB8Opffnbdb+PFdz0Be26m+ZNvx
 JEQfbxnG+SmWjx5AHXm12tPMhWZadO7C7RNfkpzOyn8QloYqLv6TbrhuOKKq9I8wIAgr
 HC+znDRcWdCFIajuz1do5CQEcze5v0vWXJB188MWB/GnUHjKlrErnnYaUOtHHWvnHzf1
 55BA==
X-Gm-Message-State: AOAM533HSzT7+Y582LQxh/S8eq7Q6tv8rgio9ReBsNrn5apDVUfyKGYP
 qwlFWpZatctLQx1oMK5XfhiW679HpHj2fcy3hAn4M9C9ZGuV/ci4y8PA0jabdbOiZ8B/ThYva8t
 PwTAP1vSgMNqBicM=
X-Received: by 2002:a05:6a00:8c4:b0:4e1:5ee9:59a1 with SMTP id
 s4-20020a056a0008c400b004e15ee959a1mr1954941pfu.51.1644997366141; 
 Tue, 15 Feb 2022 23:42:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDOOMPAQggTe1y5IwF8G8sgz5CAuC6oAIsgsi4zUL0tRxJLTvFXwsZ2zlCsxmB3XBpt+qnQA==
X-Received: by 2002:a05:6a00:8c4:b0:4e1:5ee9:59a1 with SMTP id
 s4-20020a056a0008c400b004e15ee959a1mr1954917pfu.51.1644997365832; 
 Tue, 15 Feb 2022 23:42:45 -0800 (PST)
Received: from xz-m1.local ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id mv17sm19287313pjb.14.2022.02.15.23.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 23:42:45 -0800 (PST)
Date: Wed, 16 Feb 2022 15:42:28 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v15 0/7] support dirty restraint on vCPU
Message-ID: <Ygyq5FcRVNa+Lzk+@xz-m1.local>
References: <cover.1644976045.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1644976045.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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

On Wed, Feb 16, 2022 at 12:13:31PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v15
> - rebase on master
> - drop the 'init_time_ms' parameter in function vcpu_calculate_dirtyrate 
> - drop the 'setup' field in dirtylimit_state and call dirtylimit_process
>   directly, which makes code cleaner.
> - code clean in dirtylimit_adjust_throttle
> - fix miss dirtylimit_state_unlock() in dirtylimit_process and
>   dirtylimit_query_all
> - add some comment

This version overally looks good to me, thanks.

Acked-by: Peter Xu <peterx@redhat.com>

Please remember to pick up review-by or ack-by in the future when the content
didn't change corresponds to the tag. That's not only a way to provide credits
but also a hint to reviewers so that they can skip patches that they have read
so as to save time.

Thanks,

-- 
Peter Xu


