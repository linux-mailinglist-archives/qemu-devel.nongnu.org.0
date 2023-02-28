Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3446A5785
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxt4-0007xb-84; Tue, 28 Feb 2023 06:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWxt2-0007wV-8e
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWxt0-0000Eu-U9
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677582670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=92lxxXSSADseUtEtUq/VFsjPjSGdh4REQIeaVi28QKE=;
 b=M/9GRS/1MZPM4ySpkTg5elAprlKovV2Ux3UTZELmAHS/1yxqWaw5dxXExPun380Zv2kTro
 EzLQ5RazJDqJmbgnPzDTMMkCi/+YQlzNXPe0XSYu3vKp+3wTREshA+EwxC+NZrj78Wj7Nl
 R7SAsx5nEMncczys6LTwXkjJQbyg3sw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-OLiGtVufM0K5r5f2_tRA-g-1; Tue, 28 Feb 2023 06:11:08 -0500
X-MC-Unique: OLiGtVufM0K5r5f2_tRA-g-1
Received: by mail-wr1-f69.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so1483294wrb.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92lxxXSSADseUtEtUq/VFsjPjSGdh4REQIeaVi28QKE=;
 b=W3da5X+wGZhqb73cD+cvErxfsSFQLjcuWpk7b9P6xpWDVHz6XL25ca31j9009MKUIq
 PQTN5nMcbJk31oBx71e2SxcIXFvUAXgQi/fYMap5o8Ssu1ej4HnAcXTh+Lq5eOcpWt/U
 poi8xKUhO1/rBgLnBmYmYo5LySPxD0Uxb/7HZ8uW+Expbx/Bl5biVY7JGDCszEvMs2ng
 DaEfboJk5RWY0/+UMfI90huvuh3i1aMvJgdyLl0yhDwE9nsAPtRozWRdR4MIXoVZPzF/
 oyAHPjEpk7uTQEtekHzBX+2qTHdfRjQmWAJcaRihxsOViEPxWjLCCq4REZJoEhSr2fjP
 HlHg==
X-Gm-Message-State: AO0yUKUXrHzRd0tO65UI5mMcvjQSrD+O/tTF8FJe7EplqG+b4JECf98Q
 Q369cuMITr6mqj0PnzrDNpta2plnVL8visSx3xIfzux+i7l2zTtAi02OW2NZJIDvUhI5wy91Rp4
 ndFRoThZ28Nobdiw=
X-Received: by 2002:adf:f603:0:b0:2c5:4db8:3dde with SMTP id
 t3-20020adff603000000b002c54db83ddemr1651324wrp.70.1677582667630; 
 Tue, 28 Feb 2023 03:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+sXmaResgSHI2sCBVcSmLeXi2jf46OeulWS/VCFSWS9CPeKJKpbsNG7q/faVnFgYHsp68Kgw==
X-Received: by 2002:adf:f603:0:b0:2c5:4db8:3dde with SMTP id
 t3-20020adff603000000b002c54db83ddemr1651314wrp.70.1677582667390; 
 Tue, 28 Feb 2023 03:11:07 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b003e7f1086660sm15712591wme.15.2023.02.28.03.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:11:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "John Berberian, Jr" <jeb.study@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Stefan
 Weil <sw@weilnetz.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
In-Reply-To: <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com> (John Berberian, 
 Jr.'s message of "Fri, 17 Feb 2023 21:00:10 -0500")
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
 <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Feb 2023 12:11:05 +0100
Message-ID: <87pm9ukpti.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"John Berberian, Jr" <jeb.study@gmail.com> wrote:
> ping. Is there anything I can do to help this get merged?

Hi

I have to get back from Marc/Daniel before proceed.

You did an answer, but they didn't respond.

What should we do here?

Thanks, Juan.

> Best regards,
> John Berberian, Jr.


