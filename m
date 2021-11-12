Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54C44E552
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:05:54 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUNV-00066x-LK
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mlUM4-0005IV-IE
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:04:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mlUM2-0005pI-6j
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715061;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2AMXIOisWYokskHxqIFal75rHJO6NxZrxKv8Af/NWaE=;
 b=RtSPEV7kEIC5vvmqphUwt6zZTWdn2Pib/SrvUsRxrUDIWGvjTJzAT5j5PbtLbggWcId70J
 BU71uVQ+oa1bgT2j6O55ytvy+LBa6VAtE+sP+yN+Ik4/9YVaaRF05mMPmTqkNn3rUr54d5
 zZxKWH9yHu3bBXLuIyiqLn9N9v3pEi0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-QD1eoE4UNn6vR4CK3mHheg-1; Fri, 12 Nov 2021 06:04:20 -0500
X-MC-Unique: QD1eoE4UNn6vR4CK3mHheg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so1514156wrb.11
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 03:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=2AMXIOisWYokskHxqIFal75rHJO6NxZrxKv8Af/NWaE=;
 b=vK+Hb9IUWkzgdo87XNnbk5hmnPKyy2I53I0MJE/f+F8gZCKjuCXwKKHXtH4cpd0jW3
 BVExwScJf3/f+g+fYUZL9KaVAC4Ddc0D/jL0+eF5I47nyaBi27fr1CTa8CeKLLN+EDW5
 f3JzJG9BnlnL8wWNtPbtkF57hxqnUmeodXiqGR5kccPZJ3tzb3w/YW8cwt4w1NbH4ZsF
 T29YelVZ4xDHTwSwVfYnMKBigyuMOSGhhXMjL5i0OEhT8NoSOvzkWADeIeSqmxEVEtJ+
 OC0ftWAdU0QRDZIXLyo/ML7ifHGa69claUdAHTDRRrb995ZOnFHtIPqFOMGAaWLefyZq
 ITAg==
X-Gm-Message-State: AOAM532fz7WZ6Ooyf91Q8/95uQ5wqDz1Nm6Sx0v+LE7BsggMTK+CONyF
 xVwmynCaW4X2hodB8zhI1nwItTdqXUiLhtnh5ISLYcaiIamKy2YVO2JjsFR5RoWbqUD4pX3Qty6
 Ubn9XOfAeyRbRSUk=
X-Received: by 2002:a1c:9842:: with SMTP id a63mr33465147wme.102.1636715059176; 
 Fri, 12 Nov 2021 03:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI9jC7F7g1jMXxZ8Cex6FxJAccNcPMggxKq5NRTkb8SkpcogMi+z5kJjMVQNqjf6vsGsIAxg==
X-Received: by 2002:a1c:9842:: with SMTP id a63mr33465111wme.102.1636715058909; 
 Fri, 12 Nov 2021 03:04:18 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id c11sm7517762wmq.27.2021.11.12.03.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:04:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 5/6] migration: Add migrate_use_tls() helper
In-Reply-To: <20211112051040.923746-6-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 12 Nov 2021 02:10:40 -0300")
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-6-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 12 Nov 2021 12:04:17 +0100
Message-ID: <87r1blvdn2.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> A lot of places check parameters.tls_creds in order to evaluate if TLS is
> in use, and sometimes call migrate_get_current() just for that test.
>
> Add new helper function migrate_use_tls() in order to simplify testing
> for TLS usage.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


