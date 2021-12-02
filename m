Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D6466366
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 13:19:44 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msl3v-00030v-9f
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 07:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mskuq-0005XW-DB
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 07:10:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mskuo-0002b5-3U
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 07:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638447017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QbSTMbvloc5lwE2nVViGrtRBlewlCBBbjBUODWlpfHQ=;
 b=GEYQr8C7f/kji9tw7NnNZx69E4HngBcnKbyt5lJ83rxCmIsScrokV4nvCor78eq9dfTHkr
 PTg708Zmc0lEHEdecwGK9Mn1Fn7+Ve6SYaUkPLJFL27E4aesbjoEVSk0QKVf5wx8dm+Otz
 Pdxxthwgs8iYan48eUrudzPfywoYtFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-qR5X8xNGPHik4o35lToAlQ-1; Thu, 02 Dec 2021 07:10:15 -0500
X-MC-Unique: qR5X8xNGPHik4o35lToAlQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so2401077wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 04:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=QbSTMbvloc5lwE2nVViGrtRBlewlCBBbjBUODWlpfHQ=;
 b=7XQyFMJuvuWQWQePqAw1RFnGCybs2ATkeJRxGU5uq+cYg+M4vNECI/NjY5qoxdKxW9
 8WpLIhe6P+II8Wuq0kd0MVG8uqcwTJq6z3dlXdnhJXmrS9Ohh3i0ynjSu+qAzxQFzRq9
 sq+6zExTIR1DhgRppTDc8dunlrTXw9FY2PZ6oxNAwd0fY4F0PHZYi/BIVoI06YWkvYQv
 Hr6OXrhRiNumK/sDm3a3yq7sbegYOc2xwQ39TfegYyXEPGWp7EuKk8vV9b9pQ3GUeHy3
 xyGxLWGawWlVPbbQFUVygSp23E9T6bUPmjHOcIQRQ1ghMTuke+8D8ZTExxv6SABZzuGF
 NMTQ==
X-Gm-Message-State: AOAM532PKLyjRykj0c4KBzCAZWW61Beb6lDRbWhPnLvTixZXMRDKYYwK
 sFPtByUP2CZPagj6k0vHg22KN1UJF7/XUiVENzlKOqQ0FxeWquqedWPmz+TG+tAGUqSmeiRC2+Y
 AU0FFQYBgXzuOrUs=
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr6211996wmq.124.1638447014085; 
 Thu, 02 Dec 2021 04:10:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsLOADpoupvr7fPCQyt2mqpsfJGuDGmLbL5A8hhhm8pz3z59rUVzZlXUgTg1fkHd+dt4uFNw==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr6211977wmq.124.1638447013954; 
 Thu, 02 Dec 2021 04:10:13 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id x4sm1926436wmi.3.2021.12.02.04.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:10:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
In-Reply-To: <CAJ6HWG4EadJPwiOc3xUGs2QovLeHmDLtiT+p0UimnYd1XFu4RA@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Thu, 2 Dec 2021 03:47:21
 -0300")
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica>
 <CAJ6HWG4EadJPwiOc3xUGs2QovLeHmDLtiT+p0UimnYd1XFu4RA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 02 Dec 2021 13:10:12 +0100
Message-ID: <87wnknfbrv.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> On Tue, Nov 16, 2021 at 1:08 PM Juan Quintela <quintela@redhat.com> wrote:
>>
>> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
>> I can't see a way of doing that without a qio.
>
> Yeah, I think I should leave the feature testing in here, and move the
> parameter testing to migrate_params_check() as commented before.
>
> What do you think?

The best that we can do.

Thanks, Juan.


