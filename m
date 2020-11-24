Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789342C2911
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:12:29 +0100 (CET)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZ3U-00008V-3G
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khZ2c-0007qV-HH
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:11:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khZ2Z-0007ts-0F
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606227088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B59bt9LuBX/NO/jNOxX0RIxpqOWLZERyT+FktNTg7vE=;
 b=HQh/JIpR0pXHjuN19ZWh847c5rbNPqEWLpNZK34cWfoFAmlaSbGNN3InxltIOs1r8EEBzs
 nfFvJo/HgK1waodo9ezIY+I1THkfSdpHZucyEoHG8ATbutMc+Ee9Ez4LmptrC+PVvEgqII
 Ere//TOxzgDitqtKS5wQuhS4nglt4bc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-wqoS_hLjMhSlUKdXFFSIcQ-1; Tue, 24 Nov 2020 09:11:26 -0500
X-MC-Unique: wqoS_hLjMhSlUKdXFFSIcQ-1
Received: by mail-wr1-f69.google.com with SMTP id r12so1483051wrl.3
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 06:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B59bt9LuBX/NO/jNOxX0RIxpqOWLZERyT+FktNTg7vE=;
 b=bNOgeG/+hmeweiV/35u59/RXPW8S5KMjDvXiQQf1521do0INKQUtTP3l/girE+mRIt
 DNLV6ovj8aSrL4F/SfWZBDo/3ljzECR7gIqc3Lpc477FiMg8P9J6UuZn0TJa0NbrfSl1
 3bx1+pQZlajBgT+IHM2Y1dmhnL2uhsnbYYSH6JmRLKNapGABM8QAjRyNbYrpJ7j0yos+
 NGX8Vrh/B5RaPAIvPXQUaZ5lzMDnt3olau9tWT4uBIGqWUHd2FnzA4vaEbFaMYgfWHny
 gCMYJ/y9JejbWdmKQBmE2wX9Kw4vF9MH7G0f+VflHliSP4QSTpkHtKZBi3lbQiAbC7uM
 BAgA==
X-Gm-Message-State: AOAM532W1uIQxWYi+c4vY34F/IRbdtnSojQ+1drsPmXtoLVWLPWWkuAC
 HRwRXWfrYcwHBpgmPjEmzzWvHfvARmxnKk5ia/+lDNgMcF5k5tSqxiQPAAgG2nBWf7blKM6wuov
 WLbky+VihUmbh7nk=
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr4596188wme.42.1606227085561; 
 Tue, 24 Nov 2020 06:11:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+eGKBmNGGJyDjLuZ/U4vbE+6XAfKSre2ifV3gkzq+5B5+hS3qc+FhFTjEys9YZOnv/6eslw==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr4596160wme.42.1606227085291; 
 Tue, 24 Nov 2020 06:11:25 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f17sm5872657wmh.10.2020.11.24.06.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 06:11:24 -0800 (PST)
Subject: Re: [PATCH v3] qga: Correct loop count in qmp_guest_get_vcpus()
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Lin Ma <lma@suse.com>
References: <20201120122702.4413-1-lma@suse.com>
 <CAJ+F1CLuY7XtvpJXRfkK5dBpi3ZU5VYcmJ9XndP0S8CLQ1uXPw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec802fc0-d348-6206-5cdd-20f28294d9a8@redhat.com>
Date: Tue, 24 Nov 2020 15:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLuY7XtvpJXRfkK5dBpi3ZU5VYcmJ9XndP0S8CLQ1uXPw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/20/20 1:33 PM, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Nov 20, 2020 at 4:27 PM Lin Ma <lma@suse.com
> <mailto:lma@suse.com>> wrote:
> 
>     The guest-get-vcpus returns incorrect vcpu info in case we hotunplug
>     vcpus(not
>     the last one).
>     e.g.:
>     A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2
>     and cpu3).
>     Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
> 
>     ./qmp-shell /tmp/qmp-monitor.sock
>     (QEMU) query-hotpluggable-cpus
>     {"return": [
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3},
>     "vcpus-count": 1,
>      "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2},
>     "vcpus-count": 1,
>      "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1},
>     "vcpus-count": 1,
>      "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0},
>     "vcpus-count": 1,
>      "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
>     ]}
> 
>     (QEMU) device_del id=cpu2
>     {"return": {}}
> 
>     (QEMU) query-hotpluggable-cpus
>     {"return": [
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3},
>     "vcpus-count": 1,
>      "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2},
>     "vcpus-count": 1,
>      "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1},
>     "vcpus-count": 1,
>      "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
>     {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0},
>     "vcpus-count": 1,
>      "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
>     ]}
> 
>     Before:
>     ./qmp-shell -N /tmp/qmp-ga.sock
>     Welcome to the QMP low-level shell!
>     Connected
>     (QEMU) guest-get-vcpus
>     {"return": [
>     {"online": true, "can-offline": false, "logical-id": 0},
>     {"online": true, "can-offline": true, "logical-id": 1}]}
> 
>     After:
>     ./qmp-shell -N /tmp/qmp-ga.sock
>     Welcome to the QMP low-level shell!
>     Connected
>     (QEMU) guest-get-vcpus
>     {"return": [
>     {"online": true, "can-offline": false, "logical-id": 0},
>     {"online": true, "can-offline": true, "logical-id": 1},
>     {"online": true, "can-offline": true, "logical-id": 3}]}
> 
>     Signed-off-by: Lin Ma <lma@suse.com <mailto:lma@suse.com>>
>     ---
>      qga/commands-posix.c | 45 ++++++++++++++++----------------------------
>      1 file changed, 16 insertions(+), 29 deletions(-)
> 
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index c089e38120..ee05e694d3 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -2376,24 +2376,6 @@ error:
>          return NULL;
>      }
> 
>     -#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
>     -
>     -static long sysconf_exact(int name, const char *name_str, Error **errp)
>     -{
>     -    long ret;
>     -
>     -    errno = 0;
>     -    ret = sysconf(name);
>     -    if (ret == -1) {
>     -        if (errno == 0) {
>     -            error_setg(errp, "sysconf(%s): value indefinite",
>     name_str);
>     -        } else {
>     -            error_setg_errno(errp, errno, "sysconf(%s)", name_str);
>     -        }
>     -    }
>     -    return ret;
>     -}
>     -
>      /* Transfer online/offline status between @vcpu and the guest system.
>       *
>       * On input either @errp or *@errp must be NULL.
>     @@ -2464,24 +2446,29 @@ static void
>     transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
> 
>      GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>      {
>     -    int64_t current;
>          GuestLogicalProcessorList *head, **link;
>     -    long sc_max;
>     +    g_autofree char *cpu_dir = NULL;
>     +    const gchar *line;
>     +    GDir *cpu_gdir = NULL;
>          Error *local_err = NULL;
> 
>     -    current = 0;
>          head = NULL;
>          link = &head;
>     -    sc_max = SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
>     +    cpu_dir = g_strdup_printf("/sys/devices/system/cpu");
> 
> 
> Why strdup?

As we are going to tag 5.2-rc3, what is the status of this fix?

Thanks,

Phil.


