Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383663588B6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:41:53 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWn2-0006yo-1O
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUWlb-0006F4-9x
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUWlY-0003lO-Pc
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617896419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM8xh6HcJdY/4mE3pkYR+Y7M1n9Hc9dU9WGQ1Y7ABfg=;
 b=IGSmwAfqfS3iimMPumoynLkOhiGE9OrhSQbQ61G/G1uNwX0rsW6L1VApHuIydmS7lAUjbw
 Y56AWQxb7ygRXfKeK4eJaqYxxd88G71r44CH9i7xN2Mp/CLyGuZwo9NPQUF2P+AhuViN65
 8KP0eZzLMccnwFOMlZBpnTtIuU6sZQo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-G2wWvAOuM6mNiBtyOrXNHQ-1; Thu, 08 Apr 2021 11:40:18 -0400
X-MC-Unique: G2wWvAOuM6mNiBtyOrXNHQ-1
Received: by mail-ej1-f72.google.com with SMTP id bg7so1043605ejb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 08:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qM8xh6HcJdY/4mE3pkYR+Y7M1n9Hc9dU9WGQ1Y7ABfg=;
 b=tk/K02UPe97sp5hizUnYUzaFEHxz7dIaPaCQFBLM0UharbZUn4muKPFGmOlGAaEoKB
 mhuZv/lfZy59DdevD8a8HMoN5BMj75yMqnO9Q68rz0JEIxmhFqtwWalk1P/O/yiXDgGh
 9qWIRSivLWBhpOvp7sdd/dxBzRDKIYXWb2id5ic4nRtJ0xEQoy7TB7mSKuj6MT5vSkTb
 9MLESe++ESZ1my/OB1yTfNbWPZD5mD/lrAzSYXQf4QuqO1WkC//pzQ4CyP+UE8qscFro
 spVx8jU7AOJLUPBEfkMaB7XuafQpY84oYK80XsUH2LinHDL2jGjwUIhlsKZVwo0ikzM3
 eHzQ==
X-Gm-Message-State: AOAM5319V1CIs/XhGXOi/nbtkfFy9o6/wnNYjKYU7UlAs5gwvG/uNlCs
 J14qAJPMG7AFkgO1h9qN1vnGpaxDlSKOrH7k57RLar8bQa31sfkW9ft8XbuzdGvFwtTsOf8873i
 xaFfsuwmRjfd/rmk=
X-Received: by 2002:a17:906:cd0e:: with SMTP id
 oz14mr11425125ejb.60.1617896416867; 
 Thu, 08 Apr 2021 08:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUK0Hs4aNfKBc7KT4tIjZOF8JKOspZ/AfVfLkoG4UD8fZUonApvVq1Rry1MrwSuGqgAUFGhg==
X-Received: by 2002:a17:906:cd0e:: with SMTP id
 oz14mr11425107ejb.60.1617896416712; 
 Thu, 08 Apr 2021 08:40:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id d8sm10145104edy.83.2021.04.08.08.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 08:40:16 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/11] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-5-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac7c35c0-8597-5450-e80a-cb8adac5d85f@redhat.com>
Date: Thu, 8 Apr 2021 17:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210407135021.48330-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
>       def get_qmp_events_filtered(self, wait=60.0):
>           result = []
> -        for ev in self.get_qmp_events(wait=wait):
> +        qmp_wait = wait
> +        if qemu_gdb:
> +            qmp_wait = 0.0
> +        for ev in self.get_qmp_events(wait=qmp_wait):
>               result.append(filter_qmp_event(ev))
>           return result

Should this be handled in get_qmp_events instead, since you're basically 
changing all the callers?

Paolo


