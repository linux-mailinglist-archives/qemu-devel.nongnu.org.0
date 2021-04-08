Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFE358950
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:10:14 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXES-0005m6-Vl
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX6i-0005cN-Mz
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX6g-0008R1-G5
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JEIKjswsm7Yjdh1OR5zli/4ITyi+FRah4rbaecX084=;
 b=VUogV9GgxR+9v+1KTRPSj7hQDMxc0tbYqLl3lXbW9qx8aVhbKVCIZXl5XLNgR5Gx+VdBo/
 LMU5EIXMCWgq1BXedOzNIUOq93T8N1mXXCY2UpLIrGcA92I8B53N9i54yRL5QeqpUQ6+JX
 YfAwUT3fFEkvFttOa/f+s+7NbKGcmuM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-fNtu9GUZOW-PoAbXTm2qxw-1; Thu, 08 Apr 2021 12:02:07 -0400
X-MC-Unique: fNtu9GUZOW-PoAbXTm2qxw-1
Received: by mail-wr1-f71.google.com with SMTP id r12so343787wrw.18
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1JEIKjswsm7Yjdh1OR5zli/4ITyi+FRah4rbaecX084=;
 b=tciisuZ8/BSWznpooh3dVab9AvpY1mVscr8u+Tlla1JDKSlaX1/ZK/6MF1BzY60NDK
 YH2nvv5uk5kmPZAq4yV+6+fpyeaSMCxXZs+eJso8nnNs7RLoEHrgSwX0Yn/101uivBaO
 5kB0YzeL1ielraIy+lmN8+pvrm8LhM88twH1/rUQTySvxhL1LMefJKqXiXwQH/ptTa/9
 9G8CHSVfgI2I4JFWpbrYadmRcJZ4i9nzWlHxzmDQOYriePVJ3vKQr8t6k6cuu9+D9I1X
 v25Z5700GNbAhWz+UMoE6DLv/UCeTNu56gRp38ekeahhbeFGJMaUNtg0tUC/BRmBiqxT
 lDDw==
X-Gm-Message-State: AOAM532lP+5t1blCFP01mBeceCrykBaRvx7CaCFP0E1WuRkkqvb00z7g
 sQyC8pbtO+eltMYdChNm6HUpigWJV94BqVIP8rAKTB/B1z0yJujUkgJZW9/pZGCY9erk3ejUuye
 0WZKiabm/f7ktf3c=
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr9489383wmd.151.1617897726504; 
 Thu, 08 Apr 2021 09:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEutvu5vxKqEUWCMJ42o3RpIQSbISgNdopP5EZS91fTFsFvgJjEi8OpXXElb0GmRGPP7zX2Q==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr9489348wmd.151.1617897726248; 
 Thu, 08 Apr 2021 09:02:06 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.120])
 by smtp.gmail.com with ESMTPSA id 24sm13559331wmg.19.2021.04.08.09.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 09:02:05 -0700 (PDT)
Subject: Re: [RFC PATCH v2 03/11] qemu-iotests: add option to attach gdbserver
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-4-eesposit@redhat.com>
 <cb21196a-b66c-93c5-90e8-0dcf2fa0b453@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <30e729cd-fb0c-f6d9-a545-fd9bd0e419a0@redhat.com>
Date: Thu, 8 Apr 2021 18:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cb21196a-b66c-93c5-90e8-0dcf2fa0b453@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



On 08/04/2021 17:40, Paolo Bonzini wrote:
> On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
>> +        self.gdb_qemu = os.getenv('GDB_QEMU')
>> +
>> +        if gdb and not self.gdb_qemu:
>> +            self.gdb_qemu = 'localhost:12345'
>> +        elif self.gdb_qemu and not gdb:
>> +            del self.gdb_qemu
>> +            del os.environ['GDB_QEMU']
> 
> Alternatively:
> 
>      if gdb:
>          self.gdb_qemu = os.environ.get('GDB_QEMU', 'localhost:12345')
>      elif 'GDB_QEMU' in os.environ:
>          del os.environ['GDB_QEMU']

makes sense, thanks.
> 
>> +GDB_QEMU      -- "{GDB_QEMU}"
> 
> Perhaps only include this if gdbserver is actually in use?  (Or not at 
> all, since gdbserver anyway prints the port).

You forgot that by default all logs go to a log file :) so unless you 
find the corresponding log, it is not easy to find the GDB port.

Thank you,
Emanuele

> 
> Paolo
> 


