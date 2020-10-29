Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3129F37F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 18:43:23 +0100 (CET)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYBxJ-00065A-PR
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 13:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYBtS-00048Z-TC
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYBtP-0006Cd-Oq
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603993158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKNlCNNPJgBNbYnlqjTm0JuvqVfeUjXi6t38TwXE65I=;
 b=expbKyyErDTe10IjuTo/NgoBjy3tnReucdJFi1vHMj1z2nyrwPfnwsCgdOtNQi0m3aTDYU
 QnTAEeJwdXmGGMtP0fz3Qgsy35HkE+3/64Dtk/TLfqRYzolX9tGr+xAOF7KlfIkO7Q4p0b
 E0j4i7u9ZWpc1bXeItSHdw8dZKe7PMw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-jlKl0YD-P4OOx6bLLT11aw-1; Thu, 29 Oct 2020 13:39:15 -0400
X-MC-Unique: jlKl0YD-P4OOx6bLLT11aw-1
Received: by mail-wr1-f70.google.com with SMTP id 11so459474wrc.3
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 10:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aKNlCNNPJgBNbYnlqjTm0JuvqVfeUjXi6t38TwXE65I=;
 b=HT2Cyzh+N+4l+XrzP+fHctPsMiaPVB9xP+7NTbxc5jDoSb+92oiBKRz8huzDgyO4XL
 BSDYWVKZwf3hpglj7+hbvLPLdhV2ad1QSZE12hi0a98d5YRoyLHQENJGrJI/O8nvW06C
 JXoqTBbEkUl1TpJAT880bOGnOFzF3n1IV43Jsc1k4ISAnnb9U5md+/T1Bb2OyaQwTGxn
 fdYC4U/CisJFATIhqPaVcmq6/zCyWItcR1yh7yEf4lAqNs+tZBpJ6J0I9ACQljSCDWfD
 LiiI1RoVrVeVq2nIZqbPNDE65g/rwFs4VubpYXKA+XbN3ARNOcaA1YMgphoyYJULCE1a
 RtOw==
X-Gm-Message-State: AOAM5321Vfn1YIHhpUpdDAsfwyb+MAiAdIomJupP2df7+3Ah2XSra4D8
 Q3M35Ei75KyeDEGm+V5awCOy+c6mxZfPu2vNh7RJeZr9oZrgvaopDGjJuC3gITPC/AVTsizyfGX
 SvlQhtStYSEbD0mE=
X-Received: by 2002:a1c:f417:: with SMTP id z23mr942334wma.57.1603993153875;
 Thu, 29 Oct 2020 10:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdenMS2hYmTMWZd024ezyTNBrMYykF9r8MUOoso7mcrNh4Zk9buwVGvBez4zV4SuAU0/M55Q==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr942317wma.57.1603993153648;
 Thu, 29 Oct 2020 10:39:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a199sm949410wmd.8.2020.10.29.10.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 10:39:12 -0700 (PDT)
Subject: Re: [PATCH 07/11] sockets: Fix default of UnixSocketAddress member
 @tight
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201029133833.3450220-1-armbru@redhat.com>
 <20201029133833.3450220-8-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5d93ee2c-e041-6905-56cd-fc96205e37b8@redhat.com>
Date: Thu, 29 Oct 2020 18:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029133833.3450220-8-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.261, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/10/20 14:38, Markus Armbruster wrote:
> When @tight was set to false as it should be, absent @tight defaults
> to false.  Wrong, it should default to true.  This is what breaks QMP.

When @has_tight...

Paolo


