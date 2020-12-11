Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0A2D8293
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:05:11 +0100 (CET)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrTL-0002UR-0u
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knqqI-0007CL-A2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knqqG-0003j3-OG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607725487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDG1pjH6QC+xbMvn3wYS2Yy4zGZEhwxS//PQZpzNHhA=;
 b=cz0XeK0ZBXg9oEe3pFM9xp4RjX9skHeA/4vu5SDOHJ+M+ig/A/yXUPa1NzqblAgUwN36vX
 vRKJZ97pfvFjsNBcgMvEjunc+7lTqniGJkzx3bKDAuPl0ioR7JLHEI4nIbo5ikRwTzi0Gj
 kQTGFjO8Y13XJJLWXdboUJQDGgX/AtM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-g9ibOv33MhaJIFNeskKVSw-1; Fri, 11 Dec 2020 17:24:46 -0500
X-MC-Unique: g9ibOv33MhaJIFNeskKVSw-1
Received: by mail-wr1-f69.google.com with SMTP id v5so3862960wrr.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hDG1pjH6QC+xbMvn3wYS2Yy4zGZEhwxS//PQZpzNHhA=;
 b=q6ul0Lxk5BuTGpDHpSZTj8shhAwEQal1D4apcBPFqc2whAjhaPEHLSA4pa4BVPuCM4
 7wM2tJvbIl3zYTGftNGhc9prAkngqEtYYdrXMHR9mZSfu0cxEMguvK+rWdyxpJhXk5U3
 uIcnNFjhuWzEE3LRmUruUFI3nCJhsuI22M2WPMAPB9lNX9Ww4aP01UNeG26M/KhiBzbW
 aw+m6tD3IBLuJWr0Kr9myWOYRMUE76CPOiQpSnzLf2w+9nmnLhP7GeSiKgIBAAgjVbCt
 Ku5c2D+Il/I3TBgsewUJtZ9So+Rq43noKMmvq9HBfphvId2m44/zfuk/KvPgXSULKGOe
 VIYw==
X-Gm-Message-State: AOAM5335Pkb2JTEnrJvSrgdTgWs2UJr53s60wK3lhyELsKyGqwTT7wy5
 32npQWiNyZhhxgBBBgDutgfdEy6JjM0t1YKh6SVd2Ub/g0+2//ll87r0yfjOwpM2xwiHbP/sp+E
 mn131TvJjGnkYY1U=
X-Received: by 2002:a05:600c:21d1:: with SMTP id
 x17mr15424672wmj.160.1607725485107; 
 Fri, 11 Dec 2020 14:24:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxryz5czPgAGli0vJlto3tpx1U/rUoA5Sd3XYOLqVgJUQsTwbOZXy8pQyKnJMTm39sFJ3LAJQ==
X-Received: by 2002:a05:600c:21d1:: with SMTP id
 x17mr15424656wmj.160.1607725484947; 
 Fri, 11 Dec 2020 14:24:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm318467wrs.65.2020.12.11.14.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 14:24:44 -0800 (PST)
Subject: Re: [PATCH v3 00/53] Make qdev static property API usable by any QOM
 type
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201112214350.872250-1-ehabkost@redhat.com>
 <20201211220838.GI1289986@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ab8c0cf7-537d-d0a3-cb04-1ec0f823e151@redhat.com>
Date: Fri, 11 Dec 2020 23:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211220838.GI1289986@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 23:08, Eduardo Habkost wrote:
> Paolo, do you have any objections to adding the field property
> API in this series to QOM, considering the recent discussions
> about long term plans for QOM properties?
> 
> Note that I still want to perform most of the changes in this
> series, even if the code is kept inside `hw/core`.  Moving the
> code to `qom` is just one extra step, but not essential.

Absolutely not, go ahead.

Paolo


