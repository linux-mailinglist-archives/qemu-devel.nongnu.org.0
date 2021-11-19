Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B0C456C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:31:28 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Ex-0001Gd-Uh
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo04d-0002s8-HX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo04Z-0006Ic-DF
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAZxeddsLg0mIZa/VENvY2e8gEhzIYhPLX6nJZ8l2lU=;
 b=fYTTrHtS70b3cjjWVLhS/nFff6WsOzCMZ61E/e7jRrrA8NU+sIZVCJaEkm7LO71EbCwgsO
 q/qGjqa+9kGmOdZ4WYSiRsyz7dO8xdhjEeE0Q4YrWtWiwkeXw3FDQKuKbqb/NiFZ6lOlBh
 z4rl1TbCBZheloPgn6+viCwK8uB9TsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-oLsdskyHNcS8j8k8hEA-0Q-1; Fri, 19 Nov 2021 04:20:40 -0500
X-MC-Unique: oLsdskyHNcS8j8k8hEA-0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE191006AA0;
 Fri, 19 Nov 2021 09:20:39 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C54745D740;
 Fri, 19 Nov 2021 09:20:21 +0000 (UTC)
Message-ID: <b6034e95-2bc7-e720-7b03-4e3a48118226@redhat.com>
Date: Fri, 19 Nov 2021 10:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 2/2] hw/display: Do not allow multiple identical
 VGA devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118192020.61245-1-philmd@redhat.com>
 <20211118192020.61245-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211118192020.61245-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 20:20, Philippe Mathieu-Daudé wrote:
> +    if (obj) {
> +        const char *typename = object_get_typename(obj);
> +
> +        /*
> +         * make sure this device is not being added twice,
> +         * if so exit without crashing qemu
> +         */
> +        if (object_resolve_path_type("", typename, NULL)) {
> +            error_setg(errp, "at most one %s device is permitted", typename);
> +            return false;
> +        }
> +    }
> +

Wouldn't it give the same error with one ISA and one PCI VGA?

Paolo


