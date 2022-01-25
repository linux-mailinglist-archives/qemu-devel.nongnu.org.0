Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F849B8FB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:48:39 +0100 (CET)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOzm-0000Oi-8o
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOqv-0002ZK-4A
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOqp-0007XF-Dv
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643128761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=gCTkVpuQFuTN+ZEnNE/wRhp4KZsQR2gL5dpMvrxlEss=;
 b=QtEb5CQLqjHFTfj97SVJCffLkeciF6Zzx6+O4EPYDzLEucJhX++en3lWI7SqDMNoLo9Cr7
 EL0JftL/Udj4UyXZNLqizsGgEuylnt6kmi1z2I3zpR3sYzpJlIKIlrAuVd1RLf1C8l3Z0d
 8sAvzQq5i4XgbxRorFyrK/VOff+1jao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-cQsI5hg6NNaof396yzWy7w-1; Tue, 25 Jan 2022 11:39:18 -0500
X-MC-Unique: cQsI5hg6NNaof396yzWy7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso3323926wrg.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=gCTkVpuQFuTN+ZEnNE/wRhp4KZsQR2gL5dpMvrxlEss=;
 b=NrdT9nmvwbfVa68Xi2PpsC7iyH9IrCR0bmx0bBGySEwplV/pRTBVZl5gKGjVlwU9FD
 V0gvuYNWhI6EC77b9A1HHFZ9heJzBCV8WDKvlo4eBUGwzTdFa4AxstUF6ybscR7q5tjy
 3vv5TtdpiiibD46yRXqZEn5jF4ORilWin86JOycKG36g0MFeZMVb73v7labAr/JcT2A3
 ClqMcW6TzsNKuITCcGPC3U+cWZv4aFAayQKBzHmYY9n9SFKCPOK/mLDyIRiGa10oGF1D
 J9WI5eFElSk/Wo36ShLjzBYoUjHcq0TCqTymVYqcSJ/7QgFrJM80wr97GiAPRUxirGin
 Kmtg==
X-Gm-Message-State: AOAM532uOmKlE5+jG7cxYqVpB8fC4KBH0/W3ZeOYo+pfjLX13d/l9hPb
 /8CBFlyZe8LTbcRdNmUUjw79LEuGc+gl54QFy4vSENJgUkzAEbAYnbZlK/b8PfEHPkRx8fGHrTr
 PJt+SknwDGSBAMEI=
X-Received: by 2002:a5d:4906:: with SMTP id x6mr18728469wrq.552.1643128756950; 
 Tue, 25 Jan 2022 08:39:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6XudU18Mwwyo3m4U555YS6s5SlrTdntmk/UyjkROZJrtMI1DbQ3f6vv9GW8yDMGHK9K0vCg==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr18728455wrq.552.1643128756735; 
 Tue, 25 Jan 2022 08:39:16 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id p15sm17089157wrq.66.2022.01.25.08.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:39:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call minutes for 2022-01-25
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 17:39:15 +0100
Message-ID: <87k0enrcr0.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi

Today we have the KVM devel call.  We discussed how to create machines
from QMP without needing to recompile QEMU.


Three different problems:
- startup QMP (*)
  not discussed today
- one binary or two
  not discussed today
- being able to create machines dynamically.
  everybody agrees that we want this. Problem is how.
- current greensocs approach
- interested for all architectures, they need a couple of them

what greensocs have:
- python program that is able to read a blob that have a device tree from the blob
- basically the machine type is empty and is configured from there
- 100 machines around 400 devices models
- Need to do the configuration before the machine construction happens
- different hotplug/coldplug
- How to describe devices that have multiple connections

As the discussion is quite complicated, here is the recording of it.

Later, Juan.


https://redhat.bluejeans.com/m/TFyaUsLqt3T/?share=True

*: We will talk about this on the next call


