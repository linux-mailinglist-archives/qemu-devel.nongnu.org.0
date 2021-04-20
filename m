Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E483656FA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:01:05 +0200 (CEST)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo7s-0006Sg-R6
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnto-00053U-Hr
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:46:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYntl-0001Qz-Pl
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618915588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADn1tq+besKYgzwstsK3aGDTaPi/fPOB0yl+y+Wr2VU=;
 b=GBdA4Sq04JhisXTrPAydoHdp5n+54/4qtYERloQefFEkycLgCOuIkoLqokGBvfnrhTx2hr
 LE3CdCpqDgAeZnQSsuw410nZhkZYPktYrDgohrHvVYNt/p6/GCrpUxiG7L4OCICfsbD1Qc
 t950Cgr0lNzhBnhmn6AuVESpjIxbVJ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-dS1dlvTVO9WJLEqBWjIZFg-1; Tue, 20 Apr 2021 06:46:26 -0400
X-MC-Unique: dS1dlvTVO9WJLEqBWjIZFg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j187-20020a1c23c40000b0290127873d3384so5089972wmj.6
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADn1tq+besKYgzwstsK3aGDTaPi/fPOB0yl+y+Wr2VU=;
 b=n3rYmqXo4TnapW2sI+Igf7k77GjFUJ4qeYmjRxVHB0y/VMI2HT+C/7hsQU0R8buQOJ
 Wfr5M2TPESCK1l0TbTDcbkrsCaY7yy6bhKjouj/Tn20gB+8XLh0kLG9gZle3tjnIUY5N
 hpzBDgNjoTFmPXzIUII8r+hX7azl9hZeRcKe5P7oWgYCKB5gpS3occcGnNi9lqCbosh0
 RlbIay3xEJQnUv/Rpc1vjPdgMNO/vRnKX/A0AF7IeSKjWYD6u06eoJA7rBLYxyWUw5N4
 WVVzhK30l3lyFCzep4ABaIM7ABHgNPLk26SZ1DKEXJ/cHDnir+yX9OcpB009i7EyNT82
 lliA==
X-Gm-Message-State: AOAM532V2dSRXx1amWL7rdsHLKFsvvL0CACJrAeC3JDokrJlSqYvQj7e
 jsUCVxKfD3FPDkmlV9XUnhheuWz5+7uZDjnbDZA7dJJ93M3DXHO8RJz3UKklskR1BAPaqo5vpCw
 iuNP3ssIfZvh7u3I=
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr3794945wml.22.1618915585729; 
 Tue, 20 Apr 2021 03:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt9CjFfGuL7HNUjDIksFkBH45Xd8nJDdI55aAR0cGrEScSnqNgD8uhIqeEhNE0ScyYwowISA==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr3794926wml.22.1618915585571; 
 Tue, 20 Apr 2021 03:46:25 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e9sm27728303wrs.84.2021.04.20.03.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:46:25 -0700 (PDT)
Subject: Re: [PATCH v5 12/14] hmp: Print "share" property of memory backends
 with "info memdev"
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-13-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <61ed8a55-a2f6-48ff-d3e6-064ce9348c69@redhat.com>
Date: Tue, 20 Apr 2021 12:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-13-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's print the property.
> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-hmp-cmds.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


