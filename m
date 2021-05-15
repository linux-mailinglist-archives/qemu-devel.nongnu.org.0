Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313553818E5
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:00:59 +0200 (CEST)
Received: from localhost ([::1]:56246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhtub-0000od-NW
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhtsl-0008Sd-Ki
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhtsh-000620-QP
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621083538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R/lM2H0tEoj6m/RZLn59Xfyz3aFDE19qQoJl9YUN95E=;
 b=AxUGSchEPJdQML1OHA6Lew+GT3Cutfu5OrpsAO9fEvHCACKmABorV9WLsLuVnD3jF+TJ4s
 QpoywFuPFfN9q1spE/jB8NkEjvRrosNONqbtTgG+hzZX5iyt2cdXRnGz479ve5OBOe6q9Y
 yEJgSmT5bEe1015U/YCXBK7fkOE9Llc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-UCjpMtzbPx62N3ko5IQ2JA-1; Sat, 15 May 2021 08:58:55 -0400
X-MC-Unique: UCjpMtzbPx62N3ko5IQ2JA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so1002228edq.23
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 05:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=R/lM2H0tEoj6m/RZLn59Xfyz3aFDE19qQoJl9YUN95E=;
 b=ZtnY1wyHhDDFkrCIk6h4Ti438Ycm8ZkCpDYjq81rts1YZdT4cPLg4hvJn7U3UbhS1T
 5BUBubXbKZnHZgym8Kkq0dArf14acL2ajFz/+UJf5Eb4kPaINmbPLr8vwu4nBAvV3jHr
 fM7Cv/mi4iQbNHydmZx7K+OAg8nkG3B3nmNIe6Ob73UvmQegRkqD0WXpYG9C0wtMsGKJ
 LWta0RAvhoBwJCR2HRTNQfVrWp1edCdjjFf7yt/wi3AVNMXwkM9Pmz4a0bVMcNgqza1U
 EaV/0vUTeooPvTciMqBugt4d1oerIcJmAZxuNCRBX+Z3ch8MyC+/pvjzSjUBVFtLgTbz
 Aw2g==
X-Gm-Message-State: AOAM532Qk6dQwqmXYl3BcfZItO20S92haFj+TGK8L8eRzb1+LwenR+DO
 oIwQ9xT6s8QTWgVhnB0AfHohGnp6MnIxN3s0A1fUt6V8h8aVg59UeWVNZOIXG5BvaCIqOEUOgh4
 t9P7NNYPQTaaGAw0=
X-Received: by 2002:a50:f1ca:: with SMTP id y10mr8995426edl.294.1621083533842; 
 Sat, 15 May 2021 05:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC2J3JPhqBmU1yJdHfbOWaV6E3RjT1vAIzyIPbj+bRZXCe53EwEjPybz294FPdsr9qtAh47Q==
X-Received: by 2002:a50:f1ca:: with SMTP id y10mr8995413edl.294.1621083533600; 
 Sat, 15 May 2021 05:58:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id p14sm6666040eds.28.2021.05.15.05.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 05:58:53 -0700 (PDT)
X-Mozilla-News-Host: news://lore.kernel.org:119
To: KVM list <kvm@vger.kernel.org>, qemu-devel <qemu-devel@nongnu.org>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 "kata-hypervisor@lists.katacontainers.io"
 <kata-hypervisor@lists.katacontainers.io>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: CFP Reminder: KVM Forum 2021
Message-ID: <faa18dd9-6e7c-5729-ff1c-1e9323f0aed5@redhat.com>
Date: Sat, 15 May 2021 14:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

================================================================
KVM Forum 2021 virtual experience
September 15-16, 2021

(All submissions must be received before May 31, 2021 at 23:59 PST)
=================================================================

KVM Forum is an annual event that presents a rare opportunity for
developers and users to discuss the state of Linux virtualization
technology and plan for the challenges ahead. This highly technical
conference unites the developers who drive KVM development and the users
who depend on KVM as part of their offerings, or to power their data
centers and clouds.

Sessions include updates on the state of the KVM virtualization stack,
planning for the future, and many opportunities for attendees to
collaborate. Over the years since its inclusion in the mainline kernel,
KVM has become a critical part of the FOSS cloud infrastructure. Come
join us in continuing to improve the KVM ecosystem.

Due to continuing COVID-19 safety concerns, KVM Forum 2021 will be
presented as a virtual experience. You will have the ability to network
with other attendees, attend sessions with live speaker Q&A, interact with
sponsors in real-time, and much more – all virtually, from anywhere.

We encourage you to submit and reach out to us should you have any
questions. The program committee may be contacted as a group via email:
kvm-forum-2021-pc@redhat.com.


SUGGESTED TOPICS
----------------

* Scalability and Optimization
* High Availability and Fault Tolerance
* Hardening and security
* Testing

KVM and the Linux Kernel:
* New Features and Architecture Ports
* Resource Management (CPU, I/O, Memory) and Scheduling
* Device Passthrough: VFIO, mdev, vDPA
* Network Virtualization
* Virtio and vhost

Virtual Machine Monitors and Management
* VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
* Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon, SPDK
* QEMU without KVM: Hypervisor.framework, Windows Hypervisor Platform, etc.
* Managing KVM: Libvirt, KubeVirt, Kata Containers

Emulation
* New Devices, Boards and Architectures
* CPU Emulation and Binary Translation


SUBMITTING YOUR PROPOSAL
------------------------

Abstracts due: May 31, 2021

Please submit a short abstract (~150 words) describing your presentation
proposal. Slots vary in length up to 45 minutes.

Submit your proposal here:
https://events.linuxfoundation.org/kvm-forum/program/cfp/

Please only use the categories "presentation" and "panel discussion"

You will receive a notification whether or not your presentation
proposal was accepted by August 17, 2021.

Speakers will receive a complimentary pass for the event. In case your
submission has multiple presenters, only the primary speaker for a
proposal will receive a complimentary event pass. For panel discussions,
all panelists will receive a complimentary event pass.


TECHNICAL TALKS

A good technical talk should not just report on what has happened over
the last year; it should present a concrete problem and how it impacts
the user and/or developer community. Whenever applicable, focus on work
that needs to be done, difficulties that haven't yet been solved, and on
decisions that other developers should be aware of. Summarizing recent
developments is okay but it should not be more than a small portion of
the overall talk.


END-USER TALKS

One of the big challenges as developers is to know what, where and how
people actually use our software. We will reserve a few slots for end
users talking about their deployment challenges and achievements.

If you are using KVM in production you are encouraged submit a speaking
proposal. Simply mark it as an end-user talk. As an end user, this is a
unique opportunity to get your input to developers.


PANEL DISCUSSIONS

If you are proposing a panel discussion, please make sure that you list
all of your potential panelists in your the abstract. We will request
full biographies if a panel is accepted.


HANDS-ON / BOF SESSIONS

We will reserve some time for people to get together and discuss
strategic decisions as well as other topics that are best solved within
smaller groups.

These sessions will be announced during the event. If you are interested
in organizing such a session, please add it to the list at

   http://www.linux-kvm.org/page/KVM_Forum_2021_BOF

Let people you think who might be interested know about your BOF, and
encourage them to add their names to the wiki page as well. Please add
your ideas to the list before KVM Forum starts.


HOTEL / TRAVEL
--------------

This year's event will take place at the Conference Center Dublin. For
information on hotels close to the conference, please visit
https://events.linuxfoundation.org/kvm-forum/attend/venue-travel/.
Information on conference hotel blocks will be available later in
Spring 2021.


DATES TO REMEMBER
-----------------

* CFP Closes: Monday, May 31 at 11:59 PM PST
* CFP Notifications: Monday, July 6
* Schedule Announcement: Thursday, July 8
* Slide Due Date: Monday, September 13
* Event Dates: Wednesday, September 15 – Thursday, September 16


Thank you for your interest in KVM. We're looking forward to your
submissions and, if the conditions will permit it, to seeing you at the
KVM Forum 2021 in September!

-your KVM Forum 2021 Program Committee

Please contact us with any questions or comments at
kvm-forum-2021-pc@redhat.com


