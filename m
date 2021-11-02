Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E024428B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:38:21 +0100 (CET)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoNA-0008DH-R4
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoL2-0006XJ-VW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoL0-0000JQ-Dr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQzo864IFt7dEBP6wGwA3RJDk6TUSht/jAIHHjiI+Ec=;
 b=Y3lG8vEMtuQ4b7Hp/oguoB5vs8lVu8aQRWlJ8c1d5iERgwpnKkdmdVnsWKa2vlrEHbJ7K+
 8tt/BCAxWS7yO5jwaFsKESwyWvyB9yb4mau4AWgtOyQ1F6K1RT/Z/tJoxxvHSAXWmlqh02
 qS7y8Pw7wsa8tS9WHNdtY+y5eoo1dC4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-u_-LL0e9MAC33W3yjmIWcQ-1; Tue, 02 Nov 2021 03:36:04 -0400
X-MC-Unique: u_-LL0e9MAC33W3yjmIWcQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so6083073wrc.22
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQzo864IFt7dEBP6wGwA3RJDk6TUSht/jAIHHjiI+Ec=;
 b=NrGiByBBqgZUcARwJ56lh/ABGHEYiq1zleSgxuM/yjyzIhIsyUwJXPH2BePV2wArQ1
 8g/NnlmGUS0tw+4JigR3nuQqQnEsvnfOAVKJVXnq2n9hMpkXy44zm8jaQ05C4Q5AGyzv
 qczxO9/xRqXsrGPNXNl8JTz62f8HQZFIElsxIl69ZV1X2W2FO+03+vD21LaZoXjMtSVt
 zCSZLdKXwl5NJoQK3kEiSzgn2KvgidDLH1gqBnnprIqFZTneNSFRR9zGNcYRadof1Nwe
 /Br6+c3YI7d5v8N5KBAwgKw3n8ZKDh5p05O9IIKD7Q1V0U31Ug+53QQaKcFtzV7Bn9eY
 NJ0A==
X-Gm-Message-State: AOAM531slaggH/glsfMOfDZcgRz70R6PkFJfXMw0+iH+ZFdBxxPwK5a4
 6+eRAcENkejEuEe2jLqKyzA5OUiy3mlL8CZEu4kI5ORJcm7/43TUMj93+79tB+wLotf06uXwG5z
 Cf50OvJhyozBBDnM=
X-Received: by 2002:a05:600c:3b82:: with SMTP id
 n2mr4995534wms.50.1635838563778; 
 Tue, 02 Nov 2021 00:36:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlC5PEpMXZBCOB3RsoO+aySl0IYlS7ZRwG0VEohOsNKNAVbr4GiARf3aVMBI7AHgzYCtROMg==
X-Received: by 2002:a05:600c:3b82:: with SMTP id
 n2mr4995487wms.50.1635838563555; 
 Tue, 02 Nov 2021 00:36:03 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id o40sm1570108wms.10.2021.11.02.00.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:36:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 05/26] vhost: Add x-vhost-set-shadow-vq qmp
In-Reply-To: <20211029183525.1776416-6-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 29 Oct 2021 20:35:04 +0200")
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-6-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 08:36:02 +0100
Message-ID: <87zgqnnh5p.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> Command to set shadow virtqueue mode.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

You need to keep care of:

 Markus Armbruster      ] [PATCH v2 0/9] Configurable policy for handling u=
nstable interfaces

When this hit the tree, you need to drop the x- and mark it as unstable.

Later, Juan.


