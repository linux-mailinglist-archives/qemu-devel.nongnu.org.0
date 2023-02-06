Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60C68C384
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4ZG-0005j5-Ak; Mon, 06 Feb 2023 11:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP4Yv-0005ie-4S
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:41:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP4Ys-00031v-Ir
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675701705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZLYf3PX0CAzEdb+eEBhMmy2mWJ/blmVpnhmvUTfE2M=;
 b=Xw7zF3gqsZs2mL4pzMXkqA5Wa5yw3lvUCyLPyo09TVWMlcWdl0N/51t4hGJCrTginM2T7R
 yS13NHHOPVEIMtUtoZBxdhqcosixL/xaPEBd81TR/v/Z3NbGBYx12MQnkETnjA6r423134
 ZvU+qW/GFPmYihRK06DTUwQSvLSqHzk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-3JBlDAU1OuedaV-ApOxlIg-1; Mon, 06 Feb 2023 11:41:42 -0500
X-MC-Unique: 3JBlDAU1OuedaV-ApOxlIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8261F3847980;
 Mon,  6 Feb 2023 16:41:41 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237B940CF8E2;
 Mon,  6 Feb 2023 16:41:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
In-Reply-To: <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 06 Feb 2023 17:41:33 +0100
Message-ID: <874jryn3uq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Fri, Feb 03 2023, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 2/3/23 03:44, Cornelia Huck wrote:
>> +static inline bool arm_machine_has_tag_memory(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
>> +
>> +    /* so far, only the virt machine has support for tag memory */
>> +    if (obj) {
>> +        VirtMachineState *vms = VIRT_MACHINE(obj);
>
> VIRT_MACHINE() does object_dynamic_cast_assert, and we've just done that.
>
> As this is startup, it's not the speed that matters.  But it does look unfortunate.  Not 
> for this patch set, but perhaps we ought to add TRY_OBJ_NAME to DECLARE_INSTANCE_CHECKER?

Instead of the pattern above, we could also do

VirtMachineState *vms = (VirtMachineState *) object_dynamic_cast(...);
if (vms) {
(...)


>
>> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    bool enable_mte;
>> +
>> +    switch (cpu->prop_mte) {
>> +    case ON_OFF_AUTO_OFF:
>> +        enable_mte = false;
>> +        break;
>> +    case ON_OFF_AUTO_ON:
>> +        if (tcg_enabled()) {
>> +            if (cpu_isar_feature(aa64_mte, cpu)) {
>> +                if (!arm_machine_has_tag_memory()) {
>> +                    error_setg(errp, "mte=on requires tag memory");
>> +                    return;
>> +                }
>> +            } else {
>> +                error_setg(errp, "mte not supported by this CPU type");
>> +                return;
>> +            }
>> +        }
>> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
>> +            error_setg(errp, "mte not supported by kvm");
>> +            return;
>> +        }
>> +        enable_mte = true;
>> +        break;
>
> What's here is not wrong, but maybe better structured as
>
> 	enable_mte = true;
>          if (qtest_enabled()) {
>              break;
>          }
>          if (tcg_enabled()) {
>              if (arm_machine_tag_mem) {
>                  break;
>              }
>              error;
>              return;
>          }
>          if (kvm_enabled() && kvm_arm_mte_supported) {
>              break;
>          }
>          error("mte not supported by %s", current_accel_type());
>          return;

That's indeed better, as we also see what's going on for the different
accelarators.

> We only add the property for tcg via -cpu max, so the isar check is redundant.


