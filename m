Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF82C6418
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:51:52 +0100 (CET)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicI3-0007FD-Cv
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kicH1-0006No-3a
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:50:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kicGz-0006p2-FN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606477844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hW2VNk0250Cv33dJygWDizVCdgLIjkVTAnXAxfMIhio=;
 b=O49ww5NaGHDOSZuoSEM9NO+5vxd3itOLz/ed6unb84ghUrXgt2WcnNEhUDK7smnzcOh7+N
 CCWHrIjmDYwabOkKxCvz52FEx6OTKfnJsvn7/xdLNblWhV6X4vZf5+rf7GcRnsg5bwAXXz
 wO0VJudhnuPrvnZFQFafampUb5AfIR4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-QVluScZeOxinF7kexyaH5g-1; Fri, 27 Nov 2020 06:50:42 -0500
X-MC-Unique: QVluScZeOxinF7kexyaH5g-1
Received: by mail-ej1-f72.google.com with SMTP id a13so1894788ejv.17
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 03:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hW2VNk0250Cv33dJygWDizVCdgLIjkVTAnXAxfMIhio=;
 b=XDSm43McULzWq2jQUzHC/6gf6gfBgg6++AZrPEGsHAiP7AsDg2njihNsALhYUX/V4P
 BwXZzqPIKhTvs/KfIa54MTeHPJJNMVUB7lM44VhT7+KpDfZc5jQ+dB6KxL0gOKX3OIIt
 /ttRa/dzGuwM5m/G/SMrtZVDyhollPFepztXarOLpJ1B4MMEwEskPEJrFgJIJdoOU8bM
 +8Ls4UpL3JwBS152i8g76FRKCokFMtoh8x1Z5XRRCE/a+rzN8He3Qhw/Z2lpa9Akaeom
 iVBzo+/R23p/g7+ZJFvILOhhlgREGTWaAHY7BRpiNx6ryKCwlwD7swqmob0C+T/1oCBM
 EOQw==
X-Gm-Message-State: AOAM532SJ2j9bMOWHjR1XkXSkRQ5JI+gAGDUmnSBMJy43NS+lXedX3HB
 lZTiFbXekDHJFyArkJ+g1UVnAt7aWs+taUez+byVQVS7Ac9NZbr9EROi/bTdTrNzcZLhZ4hAFPB
 BKLhTK5blra7kzwYkzu+HgzK941RBrmiFepOmsIq9vtX16dsiWdS8U7vGcSaR8QPo8KY=
X-Received: by 2002:a50:d083:: with SMTP id v3mr4661511edd.129.1606477841298; 
 Fri, 27 Nov 2020 03:50:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBNmGpo//Tx9BOytC/1pUbl1GyrwXh4BnSqBQfMXwQ8pyOzR511muzix0ovClb70iNqNdFQQ==
X-Received: by 2002:a50:d083:: with SMTP id v3mr4661491edd.129.1606477841018; 
 Fri, 27 Nov 2020 03:50:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s19sm1098263edx.7.2020.11.27.03.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:50:40 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-27-pbonzini@redhat.com>
 <20201126195551.7b761db9@redhat.com>
 <f356049d-36e1-9b63-b50d-0a9ca2d1cb96@redhat.com>
 <20201127115033.187f20ee@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/36] remove preconfig state
Message-ID: <638fe67e-a6fb-b8c9-621e-4a3daf2129ae@redhat.com>
Date: Fri, 27 Nov 2020 12:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127115033.187f20ee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 11:50, Igor Mammedov wrote:
> it works in context of this series since
> 
>    +    qemu_init_board();
>    +    qemu_create_cli_devices();
>    +    qemu_machine_creation_done();
> 
> are called within the same command qmp_x_exit_preconfig,
> if preconfig is enabled we happen to call qmp_set_numa_node()
> and if (qdev_hotplug) {error} work as expected, since qemu_init_board()
> hasn't been called yet.
> 
> but I'm thinking about what happens beyond this series, when we start
> splitting qmp_x_exit_preconfig() after this series on separate stages.

Ok, so that's the source of confusion.  I don't think anymore that 
x-exit-preconfig should be split in separate stages; I'm not looking 
anymore at being able to do device-add from "qemu-system-x86_64 
-preconfig".  Instead, I'm looking at having a completely separate 
executable for QMP-only machine creation, which would not use vl.c 
command line parsing at all.

For this reason I've left MachinePhase to a separate series, which I 
still plan for 6.0.  But I will add it here instead.

FWIW I intend to have four parts: 1) this 2) QemuOpts->keyval switch for 
-object/-M/-accel 3) making Machine's memdev property a 
link<memory-backend> 4) making -smp/-boot/-m sugar for non-scalar 
properties of Machine.  I'll definitely need your review on part 3 too!

Thanks,

Paolo

> By using qdev_hotplug here, we practically loose dependency tracking
> on qemu_init_board() not being yet called. And if later we forget that,
> then it would allow to call qmp_set_numa_node() after qemu_init_board()
> but before qemu_machine_creation_done()
> 
> So for this intermediate stage, instead of abusing qdev_hotplug adding
> a temporary is_board_created might be used. And when we introduce
> new phases you've described below, is_board_created could be replaced
> with appropriate phase check.


