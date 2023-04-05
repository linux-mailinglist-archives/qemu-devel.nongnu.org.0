Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4B6D76C1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 10:23:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjyOb-0007pf-Ta; Wed, 05 Apr 2023 04:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjyOZ-0007pC-FL
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjyOV-0008Nb-B8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680682886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwBJ3cFbofXDRgIlvYkPOazGkToddrPXCJ9Qa+MUcDc=;
 b=aFwG0+dimkYsWNwZKW/kCWH9rgN+Po1WVM8Zl0alkLBUKmXLLIDpakKZM/c8jSQYf78WNw
 g/dpkyoj5wI1mJvljzYORdzx79yElzIBsGdWjKbaK0iPba2WV/8XokmhVTShCrMY+/X25r
 ROL/kOo8A9bEhoG8ur1k4sQ3hH2uqro=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-wZeJI1JbOB2PX53fILlEgw-1; Wed, 05 Apr 2023 04:21:25 -0400
X-MC-Unique: wZeJI1JbOB2PX53fILlEgw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h18-20020adfa4d2000000b002cea098a651so4266107wrb.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 01:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680682884;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwBJ3cFbofXDRgIlvYkPOazGkToddrPXCJ9Qa+MUcDc=;
 b=Mh23Ev+TqmntzZnEAbqn+srmfGs4kLIDFrG5FZVRk+Nt1pqcs5pOrD4v85AMtUcCaO
 SudDCtXI6LMGJJmQ4/bUtTVmJ0dU/KeiI70IMoe1S1rOoABxOb/DXm88Ww6yWzXnYHod
 0jtMbP0yFLyEHjWIz/MF4J4V1Q0PnoMuRljL0svF8eXZc4NISYfSUc6IAAF/wGn1cmyf
 AXrAloJAH3AI2dsHGUThRptY0ekW4Y6mOW8LW0k/pQjtv7EabQ/N4F/a7qQQDeQModpN
 e/2b6d6ZqNy2CIc2NXZigoT9dyM7jp12SETr2Fr6jK/LfJ+HB3kS1NxUczfbCKj4fj1G
 PAIg==
X-Gm-Message-State: AAQBX9dUNXNZOchtpIqH37GfGeGxjg5YsBpeuT+cfF4+PmCHYGb3SvX1
 KF/jdEleRNXYg6ZJjzj4xFoIkymjwSD07b4EXIYwt3ta15DOdvJbl8Y/2Fbxiv1+OCT2TgbpfMs
 wX06jRS6uCRvXW4w=
X-Received: by 2002:a05:600c:24c:b0:3eb:2da4:f304 with SMTP id
 12-20020a05600c024c00b003eb2da4f304mr3727804wmj.17.1680682884348; 
 Wed, 05 Apr 2023 01:21:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQfattSFeqdxfDPepioLmgdDHOBnBMYuWA79S6zmeBhB6rHoWqACfSWV/lMT9DEIaon6Mbkw==
X-Received: by 2002:a05:600c:24c:b0:3eb:2da4:f304 with SMTP id
 12-20020a05600c024c00b003eb2da4f304mr3727782wmj.17.1680682884020; 
 Wed, 05 Apr 2023 01:21:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb?
 (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de.
 [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c020e00b003f04f0c5a6fsm1393304wmi.26.2023.04.05.01.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:21:23 -0700 (PDT)
Message-ID: <9717b867-bdc5-2fd8-1d05-95beafb226c3@redhat.com>
Date: Wed, 5 Apr 2023 10:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/16] qapi: Fix misspelled references
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-4-armbru@redhat.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230404115912.2829251-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04.04.23 13:58, Markus Armbruster wrote:
> query-cpu-definitions returns a list of CpuDefinitionInfo, but
> documentation claims CpuDefInfo, which doesn't exist.
> 
> query-migrate-capabilities returns a list of
> MigrationCapabilityStatus, but documentation claims
> MigrationCapabilitiesStatus, which doesn't exist.
> 
> balloon and query-balloon can fail with KVMMissingCap, but
> documentation claims KvmMissingCap, which doesn't exist.
> 
> Fix the documentation.
> 
> Fixes: e4e31c6324af (qapi: add query-cpu-definitions command (v2))
> Fixes: bbf6da32b5bd (Add migration capabilities)
> Fixes: d72f326431e2 (qapi: Convert balloon)
> Fixes: 96637bcdf9e0 (qapi: Convert query-balloon)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/machine-target.json | 2 +-
>   qapi/machine.json        | 4 ++--
>   qapi/migration.json      | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 2e267fa458..b94fbdb65e 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -331,7 +331,7 @@
>   #
>   # Return a list of supported virtual CPU definitions
>   #
> -# Returns: a list of CpuDefInfo
> +# Returns: a list of CpuDefinitionInfo
>   #
>   # Since: 1.2
>   ##
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 604b686e59..8c3c58c763 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1029,7 +1029,7 @@
>   #
>   # Returns: - Nothing on success
>   #          - If the balloon driver is enabled but not functional because the KVM
> -#            kernel module cannot support it, KvmMissingCap
> +#            kernel module cannot support it, KVMMissingCap
>   #          - If no balloon device is present, DeviceNotActive
>   #
>   # Notes: This command just issues a request to the guest.  When it returns,
> @@ -1067,7 +1067,7 @@
>   #
>   # Returns: - @BalloonInfo on success
>   #          - If the balloon driver is enabled but not functional because the KVM
> -#            kernel module cannot support it, KvmMissingCap
> +#            kernel module cannot support it, KVMMissingCap
>   #          - If no balloon device is present, DeviceNotActive
>   #
>   # Since: 0.14
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..87c174dca2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -531,7 +531,7 @@
>   #
>   # Returns information about the current migration capabilities status
>   #
> -# Returns: @MigrationCapabilitiesStatus
> +# Returns: @MigrationCapabilityStatus
>   #
>   # Since: 1.2
>   #

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


