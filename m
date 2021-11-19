Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FB457095
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:24:25 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4oP-0001OB-HS
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:24:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo4mn-0000g7-Gr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo4mj-0003P2-Nc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637331754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+8+5hwGwLjIe547DNZBf5Za1+14nMxohfEKG3uk0NM=;
 b=aySu7soDfZoGcNBSAXvovuppsarKVnycNPPJ9wE7XYVrgBUzmRK1jQkxYPsdsap/JFD/BN
 jEjb4JOTusooUnWwJkM0o4yxyuJiD24ic/bSZPDHNMGAbOoRK5sZdwozSEWvxZPBq1zOVC
 vxHoDiLmoiAyapnTB/1vJcIEycI9eX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-M1nfMr4IONmCGYz6Rx4W6A-1; Fri, 19 Nov 2021 09:22:29 -0500
X-MC-Unique: M1nfMr4IONmCGYz6Rx4W6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0EC10144E0;
 Fri, 19 Nov 2021 14:22:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 821865DAA5;
 Fri, 19 Nov 2021 14:22:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E803811380A7; Fri, 19 Nov 2021 15:22:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
 <87czn9honw.fsf@dusky.pond.sub.org>
 <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
Date: Fri, 19 Nov 2021 15:22:08 +0100
In-Reply-To: <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
 (Vladislav Yaroshchuk's message of "Thu, 11 Nov 2021 18:21:28 +0300")
Message-ID: <87bl2g6x9r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 akihiko.odaki@gmail.com, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I apologize for taking so long to respond.  I spotted v5, but haven't
reviewed it.  Please read my response, then assess whether you need v6.
If not, let me know, so I can have a look at v5.

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> --000000000000325dde05d084e6e4
> Content-Type: text/plain; charset="UTF-8"
> Content-Transfer-Encoding: quoted-printable
>
> =D0=B2=D1=82, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 08:41, Markus=
>  Armbruster <armbru@redhat.com>:
>
>> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>>
>> > Create separate netdevs for each vmnet operating mode:
>> > - vmnet-host
>> > - vmnet-shared
>> > - vmnet-bridged
>> >
>> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>>
>> [...]
>>
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index 7fab2e7cd8..087cdf0546 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -452,6 +452,112 @@
>> >      '*vhostdev':     'str',
>> >      '*queues':       'int' } }
>> >
>> > +##
>> > +# @NetdevVmnetHostOptions:
>> > +#
>> > +# vmnet (host mode) network backend.
>> > +#
>> > +# Allows the vmnet interface to communicate with other vmnet
>> > +# interfaces that are in host mode and also with the native host.
>> > +#
>> > +# @dhcpstart: The starting IPv4 address to use for the interface.
>> > +#             Must be in the private IP range (RFC 1918). Must be
>> > +#             specified along with @dhcpend and @subnetmask.
>> > +#             This address is used as the gateway address. The
>> > +#             subsequent address up to and including dhcpend are
>> > +#             placed in the DHCP pool.
>>
>> In QMP, we separate words by dashes, like @dhcp-start.  We may prefer
>> not to here, for consistency with NetdevUserOptions, ...
>>
>> +#
>> > +# @dhcpend: The DHCP IPv4 range end address to use for the
>> > +#           interface. Must be in the private IP range (RFC 1918).
>> > +#           Must be specified along with @dhcpstart and @subnetmask.
>>
>> ... and here, to match @dhcpstart.
>>
>> Yes, I did not use dashed exactly because of this: to be consistent with NetdevUserOptions.
>
>> +#
>> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
>> > +#              be specified along with @dhcpstart and @subnetmask.
>>
>> @subnet-mask, please.
>>
>
> So I think we can leave `dhcpstart`, `dhcpend`, but add a dash to
> `subnet-mask`.

Yes, please.

>> No support for IPv6?
>>
>>
> It's supported. vmnet-shared tested with link-local addresses.
> Also some configurable options exist, but only for 'shared' mode.
> I can try to add them in the next patch series version.

Or a later patch.

>> +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that network communication between multiple
>> > +#            vmnet interfaces instances is not possible.
>> > +#
>> > +# @net-uuid: The identifier (UUID) to uniquely identify the network.
>> > +#            If provided, no DHCP service is provided on this network
>> > +#            and the interface is added to an isolated network with
>> > +#            the specified identifier.
>>
>> Out of curiosity: identify to whom?
>>
>> If I set @net-uuid, I get an isolated network with a UUID, and if I set
>> "isolated": true, I get one without a UUID.  When would I want the
>> former, and when the latter?
>>
>>
> `if I set "isolated": true, I get one without a UUID.` is an
> incorrect statement.
>
> vmnet.framework isolation features are designed a bit weirdly (just my
> opinion).
> Most things happen on the macOS side, and we just can provide some
> configuration
> options to vmnet.framework as the user provides options to QEMU.
>
> Firstly, if you set @net-uuid, you're putting the interface into an
> isolated network.
> You can set the same @net-uuid on multiple vmnet-host interfaces, also
> outside
> QEMU, it can be any vmnet interface started in 'host' mode, ex. xhyve's
> netdev
> if they support this. All of them can communicate with each other, but only
> inside
> this net identified by the @net-uuid. They can't communicate with
> interfaces from
> network with id !=3D ${our set @net-uuid}.
>
> "@isolated" is a more prohibitive mode. "Isolated" interface is not able to
> communicate
> with anyone except the host.
>
> What happens when I set "isolated": false together with @net-uuid?
>
>
> Let's compare (vmnet-host mode):
>
> 0. When nothing is provided, DHCP is enabled and uses default
> (macOS-configured) settings.
>     Your interface can communicate with any other vmnet-host interface.
>
> 1. When provided `@isolated=3Don` only,  DHCP is still enabled, but the
> interface can
>    communicate only with the host. All the attempts to create another
> interface with
>    the same subnet will fail with `VMNET_SHARING_SERVICE_BUSY`. If we don't
>    specify DHCP settings (start, end, mask), macOS adjusts them
> automatically to
>    prevent collisions and the `VMNET_SHARING_SERVICE_BUSY` error.
>
> 2. When provided @net-uuid=3Duuid[,@isolated=3Doff], the interface can
> communicate to any
>      other interface inside the 'uuid' network. Also with other VMs under
> other hypervisors.
>      DHCP is disabled.
>
> 3. When provided @net-uuid=3Duuid,@isolated=3Don, the interface can communi=
> cate
> only with
>     the host.  DHCP is disabled. All the attempts to create another
> interface with
>     the @net-uuid will fail with `VMNET_SHARING_SERVICE_BUSY`.

The doc comments don't make this clear, I'm afraid.  Care to improve
them some?

>> When "no DCHCP service is provided", then @dhcpstart and @dhcpend become
>> misnomers.  Compare NetdevUserOptions: it uses @net to specify the
>> address range, and dhcpstart to specify the DHCP range (@dhcpend is
>> implied).  Should we aim for consistency between the two?
>>
>
> I think it is not our choice. All of these options are just mappings to
> vmnet interface
> params:
> https://developer.apple.com/documentation/vmnet/vmnet_constants

I think it *is* our choice.  We can choose to be internally consistent,
i.e. with NetdevUserOptions, or consistent with the external interface
we expose internally, i.e. with the vmnet interface.  Tradeoff.

> @subnet-mask -> vmnet_subnet_mask_key
> @dhcpstart -> vmnet_start_address_key
> @dhcpend ->  vmnet_end_address_key

Note that the right hand side does not say "DHCP".  I think the left
hand side should not, either.  Why not @start-address and @end-address?

> More detailed description is provided in the `vmnet.h` header of macOS SDK.
> There is a restriction that says: when the `vmnet_subnet_mask_key`
> (@subnet-mask)
> is set you "must also specify vmnet_start_address_key and
> vmnet_end_address_key".
> So, when "no DHCP service is provided" the`@subnet-mask` property also
> becomes
> a misnomer.

I don't think so.  vmnet_end_address_key, vmnet_end_address_key,
vmnet_subnet_mask_key all make sense regardless of DHCP service.

The gateway address is hardwired to the first address in the range.  If
DHCP is provided, it hands out addresses from the remainder of the
range.

> I added a corresponding restriction: you cannot provide @net-uuid within
> any of DHCP
> options, this causes hard failure with `error_setg()` (see vmnet-host.c).
>
>
>> +#
>> > +# Since: 6.2
>>
>> Missed 6.2, please adjust.  More of the same below.
>>
>>
> The next one is 6.3, isn't it?

7.0

>> +##
>> > +{ 'struct': 'NetdevVmnetHostOptions',
>> > +  'data': {
>> > +    '*dhcpstart':   'str',
>> > +    '*dhcpend':     'str',
>> > +    '*subnetmask':  'str',
>> > +    '*isolated':    'bool',
>> > +    '*net-uuid':    'str'
>> > +  },
>> > +  'if': 'CONFIG_VMNET' }
>> > +
>> > +##
>> > +# @NetdevVmnetSharedOptions:
>> > +#
>> > +# vmnet (shared mode) network backend.
>> > +#
>> > +# Allows traffic originating from the vmnet interface to reach the
>> > +# Internet through a network address translator (NAT). The vmnet
>> > +# interface can also communicate with the native host. By default,
>> > +# the vmnet interface is able to communicate with other shared mode
>> > +# interfaces. If a subnet range is specified, the vmnet interface can
>>
>> Do you mean "subnet mask"?
>>
>>
> This phrase was just copied from Apple's `vmnet.h` from SDK:
> ```
>  * [...] VMNET_SHARED_MODE
>  * Allows traffic originating from the vmnet interface to reach the
>  * Internet through a network address translator (NAT). The vmnet interface
>  * can also communicate with the native host. By default, the vmnet
> interface
>  * is able to communicate with other shared mode interfaces. If a subnet
> range
>  * is specified, the vmnet interface can communicate with other shared mode
>  * interfaces on the same subnet.
> ```
> But `subnet mask` sounds more suitable, so it's better to say:
> "... If a subnet mask and DHCP range is specified, the vmnet interface can
> ..."
>
>> +# communicate with other shared mode interfaces on the same subnet.
>> > +#
>> > +# @dhcpstart: The starting IPv4 address to use for the interface.
>> > +#             Must be in the private IP range (RFC 1918). Must be
>> > +#             specified along with @dhcpend and @subnetmask.
>> > +#             This address is used as the gateway address. The
>> > +#             subsequent address up to and including dhcpend are
>> > +#             placed in the DHCP pool.
>> > +#
>> > +# @dhcpend: The DHCP IPv4 range end address to use for the
>> > +#           interface. Must be in the private IP range (RFC 1918).
>> > +#           Must be specified along with @dhcpstart and @subnetmask.
>> > +#
>> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
>> > +#              be specified along with @dhcpstart and @subnetmask.
>> > +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that network communication between multiple
>> > +#            vmnet interfaces instances is not possible.
>> > +#
>> > +# Since: 6.2
>> > +##
>> > +{ 'struct': 'NetdevVmnetSharedOptions',
>> > +  'data': {
>> > +    '*dhcpstart':    'str',
>> > +    '*dhcpend':      'str',
>> > +    '*subnetmask':   'str',
>> > +    '*isolated':     'bool'
>> > +  },
>> > +  'if': 'CONFIG_VMNET' }
>>
>> [...]
>
> As a conclusion, my TODOs for now:
>   * fix `subnet range` in documentation
>   * add dash to @subnet-mask
>   * change version: 6.2 -> 6.3
>   * provide IPv6 configuration properties for vmnet-shared (optional).


