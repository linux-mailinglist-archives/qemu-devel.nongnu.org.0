Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A33588B8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWoG-0007sW-M8
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUWli-0006NI-65
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUWlf-0003rq-7W
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617896426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UptVcwB5C1xEbXmeSPvxkLq6yUKkz8JRa7h1iH0oBk=;
 b=VunoTHQ7mhVbLdGIO7p+CdXPfYEUCZ+hHzXVWtcKpcPLCnsC1aqI1r2ZxZ7abJ0b0PbXOc
 4zKMvlfvTTbk49gKOwduWa74ABQqFvyiUSs18quD1gExwfsIqgYOvy8VhDHKFlTsuX8Il7
 laymaYUy5zQyD+2mkUuDmhUG1cuVFx0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Xyh4gEUnPhuy5D9QiqwQwQ-1; Thu, 08 Apr 2021 11:40:23 -0400
X-MC-Unique: Xyh4gEUnPhuy5D9QiqwQwQ-1
Received: by mail-ej1-f72.google.com with SMTP id de56so1032732ejc.16
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 08:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UptVcwB5C1xEbXmeSPvxkLq6yUKkz8JRa7h1iH0oBk=;
 b=PDVFLlw/Cvff+QWHQYe82ZMp31x06UYK/jzm5GdPw9uJv+n86FSbs3LbxtyTiPAxsW
 wqpqbZ7iK9edn36/ZZ+5w8vy8CFzARf0oO9yEQdp8GwEyu66BRnJUik826T2X+OYKOcE
 /jrn4A9wrxDHFRjDf+eSiDJTGNVkQOnVbx10RpLcQ8STYZI74i5N1tQwLfniqd/Yp+qA
 VegvDnRanHkXmNJDA5JH7vm3ecwUw9uSh3Qp4t5JcuAYlJ+6RyfiEiK7weEEehPXSwS7
 0Q2DD3787XH6xrS12Mnu5xLhPtCJa+Hot8f/Ga2VFar5efTDGdDpcAxcCIXyL2U2EQB6
 lJLA==
X-Gm-Message-State: AOAM531V2Bf4uPtiJJRKCcyoOYeucsJ5yKYQ685ZgkqltBXWwYXxznss
 eXX7z7qM+1rVnw/XItI/gRyZYzWX2o4cVKIUWr+E+5CyOEGBOsXK36+R4omYEDjSMzYvyDG3bVl
 D8UxRcPpD9hzzQQw=
X-Received: by 2002:a17:906:c447:: with SMTP id
 ck7mr11069745ejb.218.1617896422536; 
 Thu, 08 Apr 2021 08:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxupCNZCoM0qStfu6jcNH/Z7s3CasNHcgjEQpyaPY4XMiInYHi4wwnXUhUgrFuzOYJyRCOig==
X-Received: by 2002:a17:906:c447:: with SMTP id
 ck7mr11069728ejb.218.1617896422407; 
 Thu, 08 Apr 2021 08:40:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u19sm1058928edy.23.2021.04.08.08.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 08:40:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2 03/11] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cb21196a-b66c-93c5-90e8-0dcf2fa0b453@redhat.com>
Date: Thu, 8 Apr 2021 17:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210407135021.48330-4-eesposit@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
> +        self.gdb_qemu = os.getenv('GDB_QEMU')
> +
> +        if gdb and not self.gdb_qemu:
> +            self.gdb_qemu = 'localhost:12345'
> +        elif self.gdb_qemu and not gdb:
> +            del self.gdb_qemu
> +            del os.environ['GDB_QEMU']

Alternatively:

     if gdb:
         self.gdb_qemu = os.environ.get('GDB_QEMU', 'localhost:12345')
     elif 'GDB_QEMU' in os.environ:
         del os.environ['GDB_QEMU']

> +GDB_QEMU      -- "{GDB_QEMU}"

Perhaps only include this if gdbserver is actually in use?  (Or not at 
all, since gdbserver anyway prints the port).

Paolo


