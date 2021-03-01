Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC82327C96
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:50:53 +0100 (CET)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGg8a-0007FN-1Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGg73-0006Ar-Oo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGg70-0002CU-MN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614595753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5FqQlOjW24k5Bk/AGR9X+lN4hGHUq3vvR+n/PzovyU=;
 b=HYdB3cMEKw6RKTohAkRNVD69pUSS4nwAluNpwCsSu/LOqAzm7ePaOCsF34LVAy+2EnVVjD
 ty7srfhqew58/S+tuWYHXhziSQzh99UmPLxeT8vteiS6YatVKP4FnrCFUdUEHVlHFo59nZ
 NlMSqWz58d0MLfHaibc5uJK9q+IJHKw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-PXR8SGHHPAaBjEwV9cOLZA-1; Mon, 01 Mar 2021 05:49:04 -0500
X-MC-Unique: PXR8SGHHPAaBjEwV9cOLZA-1
Received: by mail-wr1-f69.google.com with SMTP id s18so9165172wrf.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 02:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s5FqQlOjW24k5Bk/AGR9X+lN4hGHUq3vvR+n/PzovyU=;
 b=j2sCW+K9P3WD6EN0OQKqxpS5iRGOofgYohfkEuhhXbKp2lZlfVoocLxl44NK6FDgCP
 RE7UxIZLevbZhaL78V9d7bO4iKh9iQnWn7+Is9rul/9DHL9bgfvimOgZCBF5x4SDwSmw
 jjpxJLXZaTTpyQDXAg39JKHhLOldhpzQPvSXdl+tyVca/1+LLDFYmc2Ng0r+MS+63bjc
 hm/6ECbp/yqQh9jzF+w69LbLN0Px+4GbuIbQhd3Y54Go1Ao8vZwimCR6+t4P8iiMhAJq
 qhpbOYwYB7FTvM0Kq1X6JF+/DOEL0ekVmImkhl5FgkCECUm2GoucvxCTgYV0zmXBQ2jd
 HplQ==
X-Gm-Message-State: AOAM531zcwjNJk3C1NFp7K/Fi0Uv4f0Y9yAqj9IQwNW+hZLmOF/3WXzn
 6DDzrPfEMQQAn9KvtTdF7plFo9KVRfCcfYWLgqwc7DB6LiQwMYw07K/HtvXMx9RMItjniNMNLLV
 ujP5z5fX57PySfiA=
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr14837620wmi.179.1614595743315; 
 Mon, 01 Mar 2021 02:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUZeAhbz/9MILf1FDgTdD4WQ1VVxIajaRanKey9iE4RB1R62iIBxCbPYFb7xOzrlO+IAPEBg==
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr14837608wmi.179.1614595743198; 
 Mon, 01 Mar 2021 02:49:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s124sm21150494wms.40.2021.03.01.02.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 02:49:02 -0800 (PST)
Subject: Re: [PATCH 1/3] docs: vhost-user: clean up request/reply description
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-2-pbonzini@redhat.com>
 <20210301103243.qcoltqrferuetkvv@steredhat>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <66ae41b0-07ca-8aff-0e20-61437e26d3ad@redhat.com>
Date: Mon, 1 Mar 2021 11:49:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301103243.qcoltqrferuetkvv@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: jag.raman@oracle.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 11:32, Stefano Garzarella wrote:
>>
> 
> As for the slave messages, how about adding this to the beginning of 
> this section?
> 
> + For this type of message, the request is sent by the master and the
> + reply is sent by the slave.

Ok.

Paolo


